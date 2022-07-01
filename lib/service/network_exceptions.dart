import 'dart:io';
import 'package:dio/dio.dart';

abstract class NetworkExceptions {
  static String getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              return 'Request is cancelled';
              break;
            case DioErrorType.receiveTimeout:
              return 'Please try again request timed out';
              break;
            case DioErrorType.connectTimeout:
              return ' Request Timeout';
              break;
            case DioErrorType.response:
              String errorMessage = '';
              switch (error.response!.statusCode) {
                case 400:
                  errorMessage = 'Unauthorized request session is expired';
                  break;
                case 401:
                  errorMessage = 'User credentials are not valid';
                  break;
                case 403:
                  errorMessage = 'Unauthorized request session is expired';
                  break;
                case 404:
                  return   errorMessage = 'Not found';
                  break;
                case 409:
                  errorMessage = 'Not found';
                    break;
                case 413:
                  return  errorMessage = error.response!.statusMessage!;
                  break;
                case 422:
                  // DioError dioerror = error as DioError;
                     errorMessage = error.response!.data['message'];
                  break;
                case 408:
                   errorMessage = ' Request Timeout';
                  break;
                case 500:
                   errorMessage = 'something wrong on our side';
                  break;
                case 503:
                   errorMessage = 'Service is not available at this time';
                  break;
                default:
                   errorMessage =
                      'Something wrong at our end Please try again later';
              }
              return errorMessage;
              break;
            case DioErrorType.sendTimeout:
              return ' Request Timeout';
              break;
            case DioErrorType.other:
              // TODO: Handle this case.
              return ' Other issue';
              break;
          }
        } else if (error is SocketException) {
          return 'Please check your internet connection';
        } else {
          return 'Please try again later';
        }
      } on FormatException catch (e) {
        return 'Format Exception';
      } catch (_) {
        return 'Something want wrong';
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return 'Unable to process the request ';
      } else {
        return 'Something want wrong';
      }
    }
  }
}
