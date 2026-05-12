import 'package:dio/dio.dart';
import 'package:jawy/models/wheather_model.dart';

class WeatherService {
  final Dio _dio;

  WeatherService(this._dio);

  Future<WeatherModel> getWeather({required String city}) async {
    const String baseApi = 'https://api.weatherapi.com/v1/forecast.json?';
    const String apiKey = 'key=e30d28c544c74872b25135153232505';
    final url = '$baseApi$apiKey&q=$city&days=7';

    try {
      final Response response = await _dio.get(url);

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception('Connection timed out. Please try again later.');
      }

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        throw Exception(
          'Internet connection failed. Please check your network and try again.',
        );
      }

      if (e.type == DioExceptionType.badCertificate) {
        throw Exception(
          'Invalid SSL certificate. Please check your connection.',
        );
      }

      final message = e.response?.data['error']?['message'] ??
          e.message ??
          'An error occurred while fetching weather.';
      throw Exception(message);
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<String>> searchCities({required String query}) async {
    const String baseApi = 'https://api.weatherapi.com/v1/search.json?';
    const String apiKey = 'key=e30d28c544c74872b25135153232505';
    final url = '$baseApi$apiKey&q=$query';

    try {
      final Response response = await _dio.get(url);
      final List data = response.data;
      return data.map((item) => '${item['name']}, ${item['country']}').toList();
    } catch (e) {
      return [];
    }
  }
}
