import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawy/cubits/get_weather_cubit/states_get_weather.dart';
import 'package:jawy/services/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitialState());

  Future<void> getWeather(String city) async {
    emit(GetWeatherLoadingState());

    try {
      final weatherModel = await WeatherService(Dio()).getWeather(city: city);
      emit(GetWeatherSuccessState(weatherModel));
    } catch (e) {
      emit(GetWeatherErrorState(e.toString()));
    }
  }

  Future<List<String>> searchCities(String query) async {
    try {
      return await WeatherService(Dio()).searchCities(query: query);
    } catch (e) {
      return [];
    }
  }
}
