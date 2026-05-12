import 'package:jawy/models/condition.dart';
import 'package:jawy/models/json_parser.dart';

class Hour {
  final String time;
  final double tempC;
  final double tempF;
  final Condition condition;
  final double windKph;
  final double windMph;
  final int humidity;
  final double feelsLikeC;
  final double feelsLikeF;
  final double precipMm;
  final double precipIn;
  final int chanceOfRain;
  final int chanceOfSnow;

  const Hour({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.precipMm,
    required this.precipIn,
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return HourParser().parse(json);
  }
}

class HourParser implements JsonParser<Hour> {
  @override
  Hour parse(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      tempC: json['temp_c'].toDouble(),
      tempF: json['temp_f'].toDouble(),
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      windMph: json['wind_mph'].toDouble(),
      humidity: json['humidity'],
      feelsLikeC: json['feelslike_c'].toDouble(),
      feelsLikeF: json['feelslike_f'].toDouble(),
      precipMm: json['precip_mm'].toDouble(),
      precipIn: json['precip_in'].toDouble(),
      chanceOfRain: json['chance_of_rain'],
      chanceOfSnow: json['chance_of_snow'],
    );
  }
}
