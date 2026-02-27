import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/features/auth/presentation/screen/login.dart';
import 'package:think_and_wash_admin/features/home/presentation/home_screen.dart';
import 'package:think_and_wash_admin/features/route/app_routes.dart';

class RoutesNavigator {
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => Login(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      /* case AppRoutes.orders:
        return MaterialPageRoute(
          builder: (context) => TrackOrder(),
          settings: settings,
        );
      case AppRoutes.entry:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => Login(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case AppRoutes.privacyNpolicy:
        return MaterialPageRoute(
          builder: (context) => PrivayPolicy(),
          settings: settings,
        );
      case AppRoutes.helpNsupport:
        return MaterialPageRoute(
          builder: (context) => HelpAndSupport(),
          settings: settings,
        );
      case AppRoutes.watchNearn:
        return MaterialPageRoute(
          builder: (context) => WatchAndEarn(),
          settings: settings,
        );
      case AppRoutes.trackOrder:
        return MaterialPageRoute(
          builder: (context) => TrackOrder(),
          settings: settings,
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => Profile(),
          settings: settings,
        );
      case AppRoutes.dryClean:
        return MaterialPageRoute(
          builder: (context) => DryClean(),
          settings: settings,
        );
      case AppRoutes.premium:
        return MaterialPageRoute(
          builder: (context) => Premium(),
          settings: settings,
        );
      case AppRoutes.homebounds:
        return MaterialPageRoute(
          builder: (context) => HomeBounds(),
          settings: settings,
        );
      case AppRoutes.shoes:
        return MaterialPageRoute(
          builder: (context) => Shoes(),
          settings: settings,
        );
      case AppRoutes.bags:
        return MaterialPageRoute(
          builder: (context) => Bags(),
          settings: settings,
        );
      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (context) => Cart(istab: false),
          settings: settings,
        );*/
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
