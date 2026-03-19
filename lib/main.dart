import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/core/injection.dart' as di;
import 'package:think_and_wash_admin/core/shared_preference.dart';
import 'package:think_and_wash_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_bloc.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_event.dart';
import 'package:think_and_wash_admin/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await SharedPreferenceService.init();

  final bool isLoggedIn = SharedPreferenceService.getBool("isLoggedIn");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            getOtpUsecase: di.sl(),
            submitOtpUsecase: di.sl(),
          ),
        ),
        BlocProvider(
          create: (_) => di.sl<OrderBloc>()..add(LoadOrders()),
        ),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}
