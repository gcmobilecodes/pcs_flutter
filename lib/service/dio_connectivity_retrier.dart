import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'network_exceptions.dart';


class DioConnectivityRetrier {

  final RequestOptions? requestOptions;
  final Dio? dio;
  BuildContext? context;
  DioConnectivityRetrier({ this.requestOptions,  this.dio, this.context});

  Future<Response> requestRetrier() async {
    try {
      return await dio!.request(requestOptions!.path,
          data: requestOptions!.data,
          cancelToken: requestOptions!.cancelToken,
          onReceiveProgress: requestOptions!.onReceiveProgress,
          onSendProgress: requestOptions!.onReceiveProgress,
          queryParameters: requestOptions!.queryParameters);
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
