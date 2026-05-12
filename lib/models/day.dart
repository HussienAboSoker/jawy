import 'package:jawy/models/condition.dart';
import 'package:jawy/models/json_parser.dart';

class Day {
  final double maxTempC;
  final double maxTempF;
  final double minTempC;
  final double minTempF;
  final double avgTempC;
  final double avgTempF;
  final Condition condition;
  final double maxWindKph;
  final double maxWindMph;
  final double totalPrecipMm;
  final double totalPrecipIn;
  final int avgHumidity;
  final int chanceOfRain;
  final int chanceOfSnow;

  const Day({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.condition,
    required this.maxWindKph,
    required this.maxWindMph,
    required this.totalPrecipMm,
    required this.totalPrecipIn,
    required this.avgHumidity,
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return DayParser().parse(json);
  }
}

class DayParser implements JsonParser<Day> {
  @override
  Day parse(Map<String, dynamic> json) {
    return Day(
      maxTempC: json['maxtemp_c'].toDouble(),
      maxTempF: json['maxtemp_f'].toDouble(),
      minTempC: json['mintemp_c'].toDouble(),
      minTempF: json['mintemp_f'].toDouble(),
      avgTempC: json['avgtemp_c'].toDouble(),
      avgTempF: json['avgtemp_f'].toDouble(),
      condition: Condition.fromJson(json['condition']),
      maxWindKph: json['maxwind_kph'].toDouble(),
      maxWindMph: json['maxwind_mph'].toDouble(),
      totalPrecipMm: json['totalprecip_mm'].toDouble(),
      totalPrecipIn: json['totalprecip_in'].toDouble(),
      avgHumidity: json['avghumidity'],
      chanceOfRain: json['daily_chance_of_rain'],
      chanceOfSnow: json['daily_chance_of_snow'],
    );
  }
}
