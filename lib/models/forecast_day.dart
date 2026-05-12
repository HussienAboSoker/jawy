import 'package:jawy/models/day.dart';
import 'package:jawy/models/hour.dart';
import 'package:jawy/models/json_parser.dart';

class ForecastDay {
  final String date;
  final Day day;
  final List<Hour> hour;

  const ForecastDay({
    required this.date,
    required this.day,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDayParser().parse(json);
  }
}

class ForecastDayParser implements JsonParser<ForecastDay> {
  @override
  ForecastDay parse(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      hour: (json['hour'] as List)
          .map((h) => Hour.fromJson(h as Map<String, dynamic>))
          .toList(),
    );
  }
}
