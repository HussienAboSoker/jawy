import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawy/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:jawy/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jawy Weather',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            secondary: Colors.lightBlue,
            surface: Colors.white,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
