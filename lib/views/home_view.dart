import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jawy/models/wheather_model.dart';
import 'package:jawy/services/weather_service.dart';
import 'package:jawy/views/search_view.dart';
import 'package:jawy/widgets/nowhether_view.dart';
import 'package:jawy/widgets/wethaer_view.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String city);
 
}

class DioWeatherRepository implements WeatherRepository {
  final Dio _dio;

  DioWeatherRepository(this._dio);

  @override
  Future<WeatherModel> fetchWeather(String city) {
    return WeatherService(_dio).getWeather(city: city);
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final WeatherRepository _weatherRepository = DioWeatherRepository(Dio());
  WeatherModel? _weatherModel;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather('cairo');
  }

  Future<void> _loadWeather(String city) async {
    _setLoading(true);
    try {
      final model = await _weatherRepository.fetchWeather(city);
      _updateWeather(model);
    } catch (_) {
      _updateWeather(null);
    }
  }

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _updateWeather(WeatherModel? model) {
    setState(() {
      _weatherModel = model;
      _isLoading = false;
    });
  }

  Future<void> _openSearch() async {
    final result = await Navigator.push<WeatherModel?>(
      context,
      MaterialPageRoute(builder: (context) => const SearchView()),
    );

    if (result != null) {
      _updateWeather(result);
    }
  }

 
 // Helper method to build the body of the Scaffold based on the current state
  Widget _buildBody() {
    if(_weatherModel==null){
      return const NowhetherView();
    }
    if(_isLoading){
        return const CircularProgressIndicator();
    }

    return WethaerView(weatherModel: _weatherModel!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openSearch,
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: const Text('JAWY'),
      ),
      body: _buildBody(),
    );
  }
}
