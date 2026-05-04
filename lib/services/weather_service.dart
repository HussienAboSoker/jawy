
import 'package:dio/dio.dart';
import 'package:jawy/models/wheather_model.dart';

class WeatherService {
   final dio ;
  WeatherService({required this.dio});
  Future<WeatherModel> getWeather({required String city}) async {
   
    const baseApi = 'https://api.weatherapi.com/v1/forecast.json?';
    const apiKey = 'key=e30d28c544c74872b25135153232505';
    final url = '$baseApi$apiKey&q=$city&days=10';

    try {
  final Response response = await dio.get(url);
     
    return WeatherModel.fromJson(response.data);
} on DioException catch (e) {
  String message = e.response?.data["error"]["message"] ?? "An error occurred"  ;
  throw Exception(message);
} catch (e) {
  throw Exception("An unexpected error occurred: $e");
}
   
  }
}
