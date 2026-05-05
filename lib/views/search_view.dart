import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jawy/models/wheather_model.dart';
import 'package:jawy/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (value) async {
            WeatherModel weatherModel =
                await WeatherService(Dio()).getWeather(city: value);
                log(weatherModel.cityName);
          },
          maxLines: 1,
          controller: TextEditingController(),
          decoration: const InputDecoration(
            labelText: 'Search for a city',
            //hintText: 'Search for a city',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.blue,
            //     width: 2.0,
            //   ),
            // ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
