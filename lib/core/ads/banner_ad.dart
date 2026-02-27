import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:think_and_wash_admin/core/ads/ads_manager.dart';

class GlobalBannerAd extends StatefulWidget {
  const GlobalBannerAd({super.key});

  @override
  State<GlobalBannerAd> createState() => _GlobalBannerAdState();
}

class _GlobalBannerAdState extends State<GlobalBannerAd> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final width = MediaQuery.of(context).size.width.truncate();

    AdManager.instance.loadAdaptiveBanner(width).then((value) {
      if (mounted) setState(() => banner = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (banner == null) return const SizedBox();

    return SizedBox(
      height: banner!.size.height.toDouble(),
      width: banner!.size.width.toDouble(),
      child: AdWidget(ad: banner!),
    );
  }

  @override
  void dispose() {
    AdManager.instance.disposeBanner();
    super.dispose();
  }
}
