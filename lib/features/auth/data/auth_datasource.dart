import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:think_and_wash_admin/core/app_url.dart';
import 'package:think_and_wash_admin/core/exception.dart';
import 'package:think_and_wash_admin/features/auth/data/auth_model.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_entity.dart';

abstract class AuthDatasource {
  Future<String> getOtp(String phn);
  Future<AuthModel> submitOtp(AuthEntity entity);
}

class AuthDataSourceImpl extends AuthDatasource {
  @override
  Future<String> getOtp(String phn) async {
    try {
      final url = AppUrl.host + AppUrl.getOtp;
      debugPrint("this is the url in datasource to get otp: $url");
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phn}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(
          "this is the success response from backend: ${response.body} ",
        );
        return response.body;
      }
      
      // Parse backend error message
      String errorMsg = "Api error with status code: ${response.statusCode}";
      try {
        final decoded = jsonDecode(response.body);
        if (decoded['message'] != null) {
          errorMsg = decoded['message'];
        } else if (decoded['error'] != null) {
          errorMsg = decoded['error'];
        }
      } catch (_) {}

      throw ApiException(message: errorMsg);
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> submitOtp(AuthEntity entity) async {
    try {
      debugPrint("inside submit otp function");
      final url = AppUrl.host + AppUrl.verifyOtp;
      debugPrint(
        "this is the url and body of the submit otp: $url & ${jsonEncode(entity.toJson())}",
      );
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(entity.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return authModelFromJson(response.body);
      }
      
      // Parse backend error message
      String errorMsg = "Api error with status code: ${response.statusCode}";
      try {
        final decoded = jsonDecode(response.body);
        if (decoded['message'] != null) {
          errorMsg = decoded['message'];
        } else if (decoded['error'] != null) {
          errorMsg = decoded['error'];
        }
      } catch (_) {}

      throw ApiException(message: errorMsg);
    } on ApiException {
      rethrow;
    } catch (err) {
      debugPrint("inside catch bloc with err: $err");
      throw ServerException();
    }
  }
}
