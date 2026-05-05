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
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is GetWeatherSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: WethaerView(weatherModel: state.weatherModel),
            );
          }

          return const Center(
            child: Text(
              'Search for a city using the search icon.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
