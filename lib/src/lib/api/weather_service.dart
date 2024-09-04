import 'dart:developer';
import 'package:dio/dio.dart';
import 'api_repository.dart';
import '../model/current_weather_data.dart';
import '../model/five_days_data.dart';

class WeatherService {
  final String? city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=b02af426a3fad0d92d3e0b32f9324cf0';

  WeatherService({this.city});

  Future<CurrentWeatherData> getCurrentWeatherData() async {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    try {
      final response = await ApiRepository(url: url).get();
      return CurrentWeatherData.fromJson(response);
    } on DioException catch (error) {
      log('API Error Current Weather: ${error.message}');
      rethrow;
    } catch (error) {
      log('Unexpected Error Current Weather: $error');
      throw error;
    }
  }
}
