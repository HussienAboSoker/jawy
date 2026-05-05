import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jawy/models/wheather_model.dart';
import 'package:jawy/services/weather_service.dart';
import 'package:jawy/views/search_view.dart';
import 'package:jawy/widgets/nowhether_view.dart';
import 'package:jawy/widgets/wethaer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  WeatherModel? weatherModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather('cairo');
  }

  Future<void> _loadWeather(String city) async {
    setState(() => isLoading = true);
    try {
      final model = await WeatherService(Dio()).getWeather(city: city);
      setState(() {
        weatherModel = model;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        weatherModel = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
              if (result != null && result is WeatherModel) {
                setState(() => weatherModel = result);
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: const Text('JAWY'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : weatherModel != null
              ? WethaerView(weatherModel: weatherModel!)
              : const NowhetherView(),
    );
  }
}
