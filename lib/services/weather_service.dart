
import 'package:dio/dio.dart';
import 'package:jawy/models/wheather_model.dart';

class WeatherService {
  final _dio;
  WeatherService(this._dio);
  Future<WeatherModel> getWeather({required String city}) async {
    const String baseApi = 'https://api.weatherapi.com/v1/forecast.json?';
    const String apiKey = 'key=e30d28c544c74872b25135153232505';
    final url = '$baseApi$apiKey&q=$city&days=10';

    try {
      final Response response = await _dio.get(url);
       
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      // Handle specific exceptions based on the type of DioException
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception("Connection timed out. Please try again later.");
        //
      } else if (e.type == DioExceptionType.badCertificate) {
        throw Exception(
            "Invalid SSL certificate. Please check your connection.");
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception(
            "No internet connection. Please check your network settings.");
      }else {
        String message =
          e.response?.data["error"]["message"] ?? "An error occurred";
      
      throw Exception(message);}
      
      
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
