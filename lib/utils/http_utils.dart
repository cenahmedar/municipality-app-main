import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/constants/shared_preferences_constants.dart';
import 'package:municipality_app/environments/config/config.dart';
import 'package:municipality_app/utils/shared_preferences_util.dart';

enum RequestType { get, post, delete, patch, put }

class HttpUtil {
  late Dio _dio;
  BaseOptions options =
      BaseOptions(baseUrl: FlavorConfig.instance?.config.baseUrl ?? '');

  HttpUtil() {
    options.headers = {
      'X-bundle-id': 'Bundle Id.',
      'X-app-version': 'App Version',
      'X-platform-type': 'Platform Type',
      'X-os-version': 'OS Version',
      'X-accept-language': 'ar'
    };

    _dio = Dio(options);

    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      var token =
          await SharedPreferencesUtil.getString(SharedPreferencesConstants.JWT);

      if (token != null &&
          ![Apis.REFRESH_TOKEN, Apis.SIGN_IN].contains(options.path)) {
        if (!JwtDecoder.isExpired(token)) {
          handler.next(options
            ..headers.addAll({
              HttpHeaders.authorizationHeader: 'Bearer $token',
              'Content-Type': 'application/json'
            }));
        }
      } else {
        handler.next(options);
      }
    }));
    // _dio.interceptors.add(LoggingInterceptors());
  }

  Future<dynamic> makeRequest(
      {RequestType type = RequestType.get,
      required String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      int timeoutSeconds = 60}) async {
    try {
      Response response;
      switch (type) {
        case RequestType.get:
          response =
              await this._dio.get(path, queryParameters: queryParameters);
          break;
        case RequestType.post:
          response = await this
              ._dio
              .post(path, data: data, queryParameters: queryParameters);
          // .timeout(Duration(seconds: timeoutSeconds));
          break;
        case RequestType.patch:
          response = await this
              ._dio
              .patch(path, data: data, queryParameters: queryParameters);
          break;
        case RequestType.delete:
          response = await this
              ._dio
              .delete(path, data: data, queryParameters: queryParameters);
          break;
        case RequestType.put:
          response = await this
              ._dio
              .put(path, data: data, queryParameters: queryParameters);
          break;
      }
      if (response.statusCode == 200) {
        // printLog('[HTTPNetwork] SUCCESS $path');
        // printLog(response.data);
        return response.data;
      }
    } on DioError catch (e) {
      print(e);
      // printLog('[HTTPNetwork] FAILURE: $path');
      print(e.response);
      throw e.error;
    } catch (e) {
      // printLog('[HTTPNetwork] FAILURE: $path');
      print(e);
      throw e;
    }
  }
}
