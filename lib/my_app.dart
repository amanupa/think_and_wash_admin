import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_theme.dart';
import 'package:think_and_wash_admin/core/snack_bar_messages.dart';
import 'package:think_and_wash_admin/features/route/app_routes.dart';
import 'package:think_and_wash_admin/features/route/routes_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackbarService.messengerKey,
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesNavigator.controller,
      initialRoute: AppRoutes.login,
    );
  }
}
