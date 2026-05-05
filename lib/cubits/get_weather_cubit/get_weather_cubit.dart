import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawy/cubits/get_weather_cubit/states_get_weather.dart';
import 'package:jawy/models/wheather_model.dart';
import 'package:jawy/services/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitialState());

  Future<WeatherModel> getWeather(String city) async {
   
    emit(GetWeatherLoadingState());
    try {
      WeatherModel weatherModel =
          await WeatherService(Dio()).getWeather(city: city);
      emit(GetWeatherSuccessState());
      return weatherModel;
    } catch (e) {
      emit(GetWeatherErrorState());
      rethrow; // Rethrow the error to be handled by the caller
    }
  
  }
}
