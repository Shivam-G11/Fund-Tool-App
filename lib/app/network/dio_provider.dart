import 'package:dio/dio.dart';

import 'auth_interceptor.dart';

class DioProvider {
  static final String baseUrl = "https://hexeros.com/dev/fund-tool/";

  static Dio? _instance;

  static const int _maxLineWidth = 90;

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 5),
    receiveTimeout: const Duration(minutes: 5),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      return _instance!;
    } else {
      _instance!.interceptors.clear();

      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient {
    _addInterceptors();

    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(AuthorizationInterceptor());
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioProvider.setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}
