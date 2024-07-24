import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fund_tool_app/core/values/app_values.dart';
import 'package:fund_tool_app/data/secure_storage/secure_storage.dart';

import 'dio_provider.dart';

class AuthorizationInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await getApiToken();
    options.headers.addAll(
      <String, String>{'content-type': 'application/json'},
    );
    options.headers.addAll(
      <String, String>{'Accept-Language': 'en'},
    );

    if (token != null) {
      options.headers.addAll(
        <String, String>{
          'VAuthorization': await getApiToken(),
        },
      );
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final RequestOptions requestOptions = err.response!.requestOptions;
        requestOptions.headers['VAuthorization'] = await getApiToken();
        final options = Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        );
        final Dio dioRefresh = Dio(
          BaseOptions(
            baseUrl: requestOptions.baseUrl,
            headers: <String, String>{
              'accept': 'application/json',
              // 'Authorization': await getApiToken(),
            },
            connectTimeout: const Duration(minutes: 5),
            receiveTimeout: const Duration(minutes: 5),
          ),
        );

        final response = await dioRefresh.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        );
        return handler.resolve(response);
      } on DioException {
        // if (err.response?.statusCode == 401) {
        //   await SecureStorage.deleteAll();
        // }
        print("error");
      }
    }
    handler.next(err);
  }

  getApiToken() async {
    final String token =
        await SecureStorage.readSecureData(AppValues.API_TOKEN) ?? "";
    if (token != null) {
      return "Bearer $token";
    }
  }
}
