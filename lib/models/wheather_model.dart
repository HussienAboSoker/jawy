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
    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      dateTime: json['location']['localtime'],
      current: CurrentWeather.fromJson(json['current']),
      forecast: (json['forecast']['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day))
          .toList(),
    );
  }
}

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
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      hour: (json['hour'] as List).map((h) => Hour.fromJson(h)).toList(),
    );
  }
}

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

class Condition {
  final String text;
  final String icon;
  final int code;

  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
