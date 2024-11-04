import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dio_interceptor.dart';







class ApiService {
  static late Dio dio;
  static init() {
    safePrint("Initializing Dio...");
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(baseOptions);
    safePrint("Dio Initialized");
    dio.interceptors.add(PrettyDioLogger());

    dio.interceptors.add(ChuckerDioInterceptor());
    dio.interceptors.add(DioInterceptor());
    safePrint("Dio Initialized with Interceptor");
  }

  static Future<dynamic> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.post(
       endPoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      return (e);
    }
  }

  static Future<dynamic> uploadFile({
    required String endPoint,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      var response = await dio.post(
        endPoint,
        data: formData,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      return (e);
    }
  }

  static Future<dynamic> putData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      var response = await dio.put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> patchData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
    bool isRaw = false,
  }) async {
    try {
      var response = await dio.patch(
        endPoint,
        data: data == null
            ? null
            : isRaw
                ? data
                : FormData.fromMap(data),
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<dynamic> deleteData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      var response = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<dynamic> getData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      safePrint(response);
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }
}