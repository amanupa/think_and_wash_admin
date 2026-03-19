import 'package:get_it/get_it.dart';
import 'package:think_and_wash_admin/features/auth/data/auth_datasource.dart';
import 'package:think_and_wash_admin/features/auth/data/auth_repository_impl.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_repository.dart';
import 'package:think_and_wash_admin/features/auth/domain/get_otp_usecase.dart';
import 'package:think_and_wash_admin/features/auth/domain/submit_otp_usecase.dart';
import 'package:think_and_wash_admin/features/order/data/datasource/order_remote_datasource.dart';
import 'package:think_and_wash_admin/features/order/data/order_repository_impl.dart';
import 'package:think_and_wash_admin/features/order/domain/get_vendor_orders_usecase.dart';
import 'package:think_and_wash_admin/features/order/domain/order_repository.dart';
import 'package:think_and_wash_admin/features/order/domain/update_order_status_usecase.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_bloc.dart';

final sl = GetIt.instance;

void init() {
  _dataSources();
  _repositories();
  _useCases();
}

void _dataSources() {
  sl.registerLazySingleton<AuthDatasource>(() => AuthDataSourceImpl());
  sl.registerLazySingleton<OrderRemoteDatasource>(
    () => OrderRemoteDatasourceImpl(),
  );
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(remoteDatasource: sl()),
  );
}

void _useCases() {
  // Auth
  sl.registerLazySingleton(() => GetOtpUsecase(repository: sl()));
  sl.registerLazySingleton(() => SubmitOtpUsecase(repository: sl()));

  // Orders
  sl.registerLazySingleton(() => GetVendorOrdersUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdateOrderStatusUsecase(repository: sl()));

  // Blocs
  sl.registerFactory(
    () => OrderBloc(
      getVendorOrdersUsecase: sl(),
      updateOrderStatusUsecase: sl(),
    ),
  );
}
