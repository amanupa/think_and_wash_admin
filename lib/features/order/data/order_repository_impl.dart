import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:think_and_wash_admin/core/exception.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import 'package:think_and_wash_admin/features/order/data/datasource/order_remote_datasource.dart';
import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';
import 'package:think_and_wash_admin/features/order/domain/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDatasource remoteDatasource;

  OrderRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getVendorOrders() async {
    try {
      final orders = await remoteDatasource.getVendorOrders();
      return right(orders);
    } on ApiException catch (err) {
      return left(ApiFailure(message: err.message));
    } on ServerException {
      return left(const ServerFailure(message: "Server error"));
    } catch (err) {
      debugPrint("Order repository error: $err");
      return left(ServerFailure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    try {
      final order = await remoteDatasource.updateOrderStatus(
        orderId: orderId,
        status: status,
      );
      return right(order);
    } on ApiException catch (err) {
      return left(ApiFailure(message: err.message));
    } on ServerException {
      return left(const ServerFailure(message: "Server error"));
    } catch (err) {
      debugPrint("Order update error: $err");
      return left(ServerFailure(message: err.toString()));
    }
  }
}
