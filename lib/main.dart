import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:think_and_wash_admin/my_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (_) => AuthBloc())],
      child: MyApp(),
    ),
  );
}
