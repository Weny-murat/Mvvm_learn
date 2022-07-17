import 'package:dio/dio.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    return dio;
  }
}
