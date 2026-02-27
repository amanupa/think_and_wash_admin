import 'dart:io';
import 'dart:ui';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  AdManager._();
  static final AdManager instance = AdManager._();
  BannerAd? _banner;
  RewardedAd? _rewardedAd;
  BannerAd? get banner => _banner;

  Future<BannerAd?> loadAdaptiveBanner(int width) async {
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      width,
    );

    if (size == null) return null;

    _banner?.dispose();

    _banner = BannerAd(
      size: size,
      adUnitId: _bannerId,
      listener: const BannerAdListener(),
      request: const AdRequest(),
    )..load();

    return _banner;
  }

  /// -------- REWARDED AD --------

  /// LOAD
  void loadRewardedAd({VoidCallback? onLoaded}) {
    RewardedAd.load(
      adUnitId: _rewardedId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd?.dispose(); // dispose old
          _rewardedAd = ad;
          onLoaded?.call();
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
        },
      ),
    );
  }

  /// SHOW
  void showRewardedAd({required Function(int amount, String type) onReward}) {
    if (_rewardedAd == null) return;

    final ad = _rewardedAd!;
    _rewardedAd = null;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        loadRewardedAd(); // preload next
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        loadRewardedAd();
      },
    );

    ad.show(
      onUserEarnedReward: (ad, reward) {
        onReward(reward.amount.toInt(), reward.type);
      },
    );
  }

  String get _rewardedId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917'; // TEST ID
    } else {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
  }

  String get _bannerId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
  }

  void disposeBanner() {
    _banner?.dispose();
    _banner = null;
  }

  void disposeRewarded() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
  }
}
