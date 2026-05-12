import 'package:flutter/material.dart';
import 'package:jawy/models/wheather_model.dart';

class WethaerView extends StatelessWidget {
  const WethaerView({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Weather Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '${weatherModel.cityName}, ${weatherModel.country}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Updated: ${weatherModel.dateTime}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${weatherModel.current.tempC.toInt()}°C',
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              weatherModel.current.condition.text,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              'https:${weatherModel.current.condition.icon}',
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              'Feels like ${weatherModel.current.feelsLikeC.toInt()}°C',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDetail(
                            'Wind', '${weatherModel.current.windKph} km/h'),
                        _buildDetail(
                            'Humidity', '${weatherModel.current.humidity}%'),
                        _buildDetail('Precip',
                            '${weatherModel.forecast[0].day.totalPrecipMm} mm'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '7-Day Forecast',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Forecast Cards
            ...weatherModel.forecast.map((day) => Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      'https:${day.day.condition.icon}',
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      _formatDate(day.date),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(day.day.condition.text),
                    trailing: Text(
                      '${day.day.maxTempC.toInt()}° / ${day.day.minTempC.toInt()}°',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatDate(String date) {
    final DateTime parsed = DateTime.parse(date);
    final now = DateTime.now();
    if (parsed.day == now.day) return 'Today';
    if (parsed.day == now.day + 1) return 'Tomorrow';
    return '${parsed.day}/${parsed.month}';
  }
}
