class WeatherModel {
  final String cityName;
  final double maxTemperature;
  final double minTemperature;
  final double averageTemperature;
  final String description;
  final String dateTime ;

  const WeatherModel( {
    required this.dateTime,
    required this.cityName,
    required this.maxTemperature,
    required this.minTemperature,
    required this.averageTemperature,
    required this.description,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
     dateTime: json['location']['localtime'],
      cityName: json['location']['name'],
     
      maxTemperature: json['forecast']["forecastday"][0]['day']['maxtemp_c'].toDouble(),
      minTemperature: json['forecast']["forecastday"][0]['day']['mintemp_c'].toDouble(),
      averageTemperature: json['forecast']["forecastday"][0]['day']['avgtemp_c'].toDouble(),
      description: json['forecast']["forecastday"][0]['day']['condition']['text'],
    );
  }
} 