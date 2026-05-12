import 'package:jawy/models/models.dart';

class GetWeatherState {}

class GetWeatherInitialState extends GetWeatherState {}

class GetWeatherLoadingState extends GetWeatherState {}

class GetWeatherSuccessState extends GetWeatherState {
  final WeatherModel weatherModel;

  GetWeatherSuccessState(this.weatherModel);
}

class GetWeatherErrorState extends GetWeatherState {
  final String message;

  GetWeatherErrorState(this.message);
}
