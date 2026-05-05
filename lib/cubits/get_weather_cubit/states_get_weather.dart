import 'package:jawy/models/wheather_model.dart';

class GetWeatherState {}

class GetWeatherInitialState extends GetWeatherState {}

class GetWeatherLoadingState extends GetWeatherState {}
class GetWeatherSuccessState extends GetWeatherState {
  
}
class GetWeatherErrorState extends GetWeatherState {}
