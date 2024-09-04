import 'dart:developer';
import 'package:get/get.dart';
import '../model/current_weather_data.dart';
import '../api/weather_service.dart';

class HomeController extends GetxController {
  final String? city;
  var isLoading = false.obs;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];

  HomeController({this.city});

  @override
  void onInit() {
    super.onInit();
    fetchData();
    update();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      currentWeatherData =
          await WeatherService(city: city ?? "").getCurrentWeatherData();
      await getTopFiveCities();
      update();
    } catch (error) {
      log('Error fetching weather data: $error');
    }
    finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getTopFiveCities() async {
    final cities = ['karachi', 'islamabad', 'delhi', 'multan', 'faisalabad'];

    try {
      dataList.clear();
      for (final city in cities) {
        final data = await WeatherService(city: city).getCurrentWeatherData();
        dataList.add(data);
      }
    } catch (error) {
      log('Error fetching data: $error');
    } finally {
      update();
    }
  }
}
