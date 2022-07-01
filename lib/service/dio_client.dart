import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'dio_connectivity_retrier.dart';



class DioClient {

  Dio? dio;
  CacheStore? cacheOptions;
  String? dbPath;
  CancelToken cancelToken=CancelToken();

  DioClient(Dio dio) {
    this.dio = dio;
  }

  Future<Response> get(
    String uri, {
     Map<String, dynamic>? queryParameters,
     Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {

    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (error) {
      if (error is DioError) {
        switch (error.response!.statusCode) {
          case 401:
            return await DioConnectivityRetrier(
                    dio: dio, requestOptions: error.requestOptions).requestRetrier();
            break;
          default:
            throw error;
            break;
        }
      } else {
        throw error;
      }
    }
  }



  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (error) {
      if (error is DioError) {
        switch (error.response!.statusCode) {
          case 401:
            return await DioConnectivityRetrier(
                    dio: dio, requestOptions: error.requestOptions)
                .requestRetrier();
            break;
          default:
            throw error;
            break;
        }
      } else {
        throw error;
      }
    }
  }

  Future<Response> delete(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.delete(uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (error) {
      if (error is DioError) {
        switch (error.response!.statusCode) {
          case 401:
            return await DioConnectivityRetrier(
                    dio: dio, requestOptions: error.requestOptions)
                .requestRetrier();
            break;
          default:
            throw error;
            break;
        }
      } else {
        throw error;
      }
    }
  }



  Future<dynamic> download(
      String uri, {
        data,
        String? savePath,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dio!.download(
        uri,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (error) {
      if (error is DioError) {
        switch (error.response!.statusCode) {
          case 401:
            return await DioConnectivityRetrier(
                dio: dio, requestOptions: error.requestOptions)
                .requestRetrier();
            break;
          default:
            throw error;
            break;
        }
      } else {
        throw error;
      }
    }
  }

}
