import 'package:jawy/models/condition.dart';
import 'package:jawy/models/json_parser.dart';

class CurrentWeather {
  final double tempC;
  final double tempF;
  final Condition condition;
  final double windKph;
  final double windMph;
  final int humidity;
  final double feelsLikeC;
  final double feelsLikeF;

  const CurrentWeather({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.feelsLikeC,
    required this.feelsLikeF,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherParser().parse(json);
  }
}

class CurrentWeatherParser implements JsonParser<CurrentWeather> {
  @override
  CurrentWeather parse(Map<String, dynamic> json) {
    return CurrentWeather(
      tempC: json['temp_c'].toDouble(),
      tempF: json['temp_f'].toDouble(),
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      windMph: json['wind_mph'].toDouble(),
      humidity: json['humidity'],
      feelsLikeC: json['feelslike_c'].toDouble(),
      feelsLikeF: json['feelslike_f'].toDouble(),
    );
  }
}
