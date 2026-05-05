import 'package:flutter/material.dart';
import 'package:jawy/models/wheather_model.dart';

class WethaerView extends StatelessWidget {
  const WethaerView({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         Text(weatherModel.cityName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
         Text('update: ${weatherModel.dateTime}',
            style: const TextStyle(
              fontSize: 16,
            ),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/clear.png',
              height: 100,
              width: 100,
            ),
             Text('${weatherModel.averageTemperature.toInt()}°',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
             Column(
              children: [
                 Text('${weatherModel.maxTemperature.toInt()}°',
                    style: const TextStyle(
                      fontSize: 16,
                    ),),
                 Text('${weatherModel.minTemperature.toInt()}°',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
