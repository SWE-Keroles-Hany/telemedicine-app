import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_services.dart';
import 'package:telemedicine/core/network/dio_interceptor.dart';
import 'package:telemedicine/core/network/methods.dart';

import 'api_constants.dart';

class DioServices implements APIServices {
  final Dio dio;
  DioServices(this.dio) {
    dio.options.baseUrl = APICONSTANTS.baseURL;
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    dio.interceptors.add(DioInterceptors());
  }

  @override
  Future<dynamic> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParams,
        options: options,
      );
      return handleResponse(response);
    } on DioException catch (exception) {
      debugPrint("**** We Are Here");
      return handleDioError(exception);
    } catch (error) {
      log("Error in Dio POST: ${error.toString()}");
      throw Failure(message: "Some Thing Went Wrong");
    }
  }

  @override
  Future<dynamic> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.put(
        endPoint,
        data: data,
        queryParameters: queryParams,
      );
      return handleResponse(response);
    } on DioException catch (exception) {
      return handleDioError(exception);
    } catch (_) {
      throw Failure(message: "Some Thing Went Wrong");
    }
  }

  @override
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(endPoint, queryParameters: queryParams);
      return handleResponse(response);
    } on DioException catch (exception) {
      return handleDioError(exception);
    } catch (_) {
      throw Failure(message: "Some Thing Went Wrong");
    }
  }

  @override
  Future<dynamic> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParams,
      );
      return handleResponse(response);
    } on DioException catch (exception) {
      return handleDioError(exception);
    } catch (_) {
      throw Failure(message: "Some Thing Went Wrong");
    }
  }
}
