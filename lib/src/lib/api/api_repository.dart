import 'dart:developer';
import 'package:dio/dio.dart';

class ApiRepository {
  final String? url;

  ApiRepository({this.url});

  Dio dio = Dio();

  Future<dynamic> get() async {
    try {
      final response = await dio.get(url ?? "");
      if (response.statusCode == 200) {
        log('API Response Success: ${response.data}\n\n\n');
        return response.data;
      } else {
        final error = DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
        log('API Error: Status Code: ${response.statusCode}');
        throw error;
      }
    } on DioException catch (error) {
      log('API Error: ${error.message}');
      throw error;
    } catch (error) {
      log('Unexpected Error: $error');
      throw error;
    }
  }
}
