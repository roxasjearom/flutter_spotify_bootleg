import 'package:dio/dio.dart';

Dio buildDioClient(String baseUrl) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  //TODO: Add interceptors here
  return dio;
}
