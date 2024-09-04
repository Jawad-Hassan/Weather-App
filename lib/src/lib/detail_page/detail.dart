import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/current_weather_data.dart';

class DetailsPage extends StatelessWidget {
  final CurrentWeatherData? cityWeather;

  const DetailsPage({super.key, required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${cityWeather?.name} Weather'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${cityWeather?.name}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Text(
              'Temperature: ${(cityWeather!.main!.temp! - 273.15).round().toString()}\u2103',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Weather: ${cityWeather?.weather?.first.description?.toUpperCase() ?? ''}',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Humidity: ${cityWeather?.main?.humidity ?? ''}%',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Pressure: ${cityWeather!.main?.pressure ?? ''}%',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Feels Like: ${(cityWeather!.main!.feelsLike! - 273.15).round().toString()}\u2103',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Temp Min: ${(cityWeather!.main!.tempMin! - 273.15).round().toString()}\u2103',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Temp Min: ${(cityWeather!.main!.tempMax! - 273.15).round().toString()}\u2103',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
