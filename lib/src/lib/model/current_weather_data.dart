import 'package:weather_forecast/src/lib/model/weather.dart';
import 'coord.dart';
import 'main_weather.dart';

class CurrentWeatherData {
  final Coord? coord;
  final List<Weather>? weather;
  final MainWeather? main;
  final String? name;

  CurrentWeatherData({
    this.coord,
    this.weather,
    this.main,
    this.name,
  });

  factory CurrentWeatherData.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherData();
    }

    return CurrentWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather:
          (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
      main: MainWeather.fromJson(json['main']),
      name: json['name'],
    );
  }
}
