import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:think_and_wash_admin/core/app_url.dart';
import 'package:think_and_wash_admin/core/exception.dart';
import 'package:think_and_wash_admin/core/secure_storage.dart';
import 'package:think_and_wash_admin/features/order/data/order_model.dart';

abstract class OrderRemoteDatasource {
  Future<List<OrderModel>> getVendorOrders();
  Future<OrderModel> updateOrderStatus({
    required String orderId,
    required String status,
  });
}

class OrderRemoteDatasourceImpl implements OrderRemoteDatasource {
  Future<String> _getToken() async {
    final token = await SecureStorageService.readData(key: "auth_token");
    if (token == null) throw ApiException(message: "No auth token found");
    return token;
  }

  Map<String, String> _headers(String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  @override
  Future<List<OrderModel>> getVendorOrders() async {
    try {
      final token = await _getToken();
      final url = AppUrl.host + AppUrl.vendorOrders;
      debugPrint("Fetching vendor orders from: $url");

      final response = await http.get(
        Uri.parse(url),
        headers: _headers(token),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> data = decoded['data'] ?? [];
        return data.map((e) => OrderModel.fromJson(e)).toList();
      }

      throw ApiException(message: _parseError(response));
    } on ApiException {
      rethrow;
    } catch (err) {
      debugPrint("Order fetch error: $err");
      throw ServerException();
    }
  }

  @override
  Future<OrderModel> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    try {
      final token = await _getToken();
      final url = AppUrl.host + AppUrl.updateOrderStatus;
      debugPrint("Updating order status: $orderId → $status");

      final response = await http.post(
        Uri.parse(url),
        headers: _headers(token),
        body: jsonEncode({"orderId": orderId, "status": status}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = jsonDecode(response.body);
        return OrderModel.fromJson(decoded['data']);
      }

      throw ApiException(message: _parseError(response));
    } on ApiException {
      rethrow;
    } catch (err) {
      debugPrint("Order update error: $err");
      throw ServerException();
    }
  }

  String _parseError(http.Response response) {
    try {
      final decoded = jsonDecode(response.body);
      return decoded['message'] ?? "Api error: ${response.statusCode}";
    } catch (_) {
      return "Api error: ${response.statusCode}";
    }
  }
}
