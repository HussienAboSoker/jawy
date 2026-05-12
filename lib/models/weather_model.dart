import 'package:jawy/models/current_weather.dart';
import 'package:jawy/models/forecast_day.dart';
import 'package:jawy/models/json_parser.dart';

class WeatherModel {
  final String cityName;
  final String country;
  final String dateTime;
  final CurrentWeather current;
  final List<ForecastDay> forecast;

  const WeatherModel({
    required this.cityName,
    required this.country,
    required this.dateTime,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModelParser().parse(json);
  }
}

class WeatherModelParser implements JsonParser<WeatherModel> {
  @override
  WeatherModel parse(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      dateTime: json['location']['localtime'],
      current: CurrentWeather.fromJson(json['current']),
      forecast: (json['forecast']['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day as Map<String, dynamic>))
          .toList(),
    );
  }
}
