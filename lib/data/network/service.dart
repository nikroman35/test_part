import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'interceptor.dart';
import 'network_const.dart';
import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';

const _connectTimeoutMS = 1000000;
const _receiveTimeoutMS = 1000000;

class NetworkClient {
  final AppInterceptor appInterceptor;

  NetworkClient(
    this.appInterceptor,
  );

  Dio create() {
    final Dio client = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: _connectTimeoutMS),
        receiveTimeout: const Duration(milliseconds: _receiveTimeoutMS),
        sendTimeout: const Duration(milliseconds: _receiveTimeoutMS),
      ),
    );
    client.interceptors.addAll([
      if (!kReleaseMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      MockInterceptor(),
      InterceptorsWrapper(onError: (options, handler) async {
        appInterceptor.onError(options, handler);
      }),
    ]);

    return client;
  }
}
