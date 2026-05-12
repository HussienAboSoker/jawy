import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawy/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:jawy/cubits/get_weather_cubit/states_get_weather.dart';
import 'package:jawy/views/search_view.dart';
import 'package:jawy/widgets/wethaer_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _openSearch(BuildContext context) async {
    final city = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const SearchView()),
    );

    if (!context.mounted) return;
    if (city != null && city.isNotEmpty) {
      context.read<GetWeatherCubit>().getWeather(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _openSearch(context),
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: const Text('JAWY'),
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetWeatherErrorState) {
            return Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32),
                child: Card(
                  color: Colors.red[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: Colors.red[700],
                        fontSize: isSmallScreen ? 16 : 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is GetWeatherSuccessState) {
            return Padding(
              padding: EdgeInsets.all(isSmallScreen ? 8 : 16),
              child: WethaerView(weatherModel: state.weatherModel),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  size: isSmallScreen ? 64 : 80,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'Search for a city using the search icon.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
