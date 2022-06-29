import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_search/helper/api_key.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiKey.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getAllData({
    @required url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': "Bearer " + token!,
    };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postDat({
    required url,
    Map<String, dynamic>? query,
    data,
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': "Bearer " + token!,
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    @required url,
    Map<String, dynamic>? query,
    data,
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': "Bearer " + token!,
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postData({
    required url,
    Map<String, dynamic>? query,
    data,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json"
      // "Content-Type" : "multipart/form-data",
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}