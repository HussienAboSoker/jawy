import 'package:flutter/material.dart';
import 'package:jawy/models/models.dart';

class WethaerView extends StatelessWidget {
  const WethaerView({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final padding = isSmallScreen ? 16.0 : 24.0;

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Weather Card
          Card(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  Text(
                    '${weatherModel.cityName}, ${weatherModel.country}',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 20 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Updated: ${weatherModel.dateTime}',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 400;
                      return isNarrow
                          ? Column(
                              children: [
                                _buildTempSection(isSmallScreen),
                                const SizedBox(height: 16),
                                _buildIconSection(isSmallScreen),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildTempSection(isSmallScreen),
                                _buildIconSection(isSmallScreen),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
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
          SizedBox(height: padding),
          Text(
            '7-Day Forecast',
            style: TextStyle(
              fontSize: isSmallScreen ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Forecast Cards
          ...weatherModel.forecast.map((day) => Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: Image.network(
                    'https:${day.day.condition.icon}',
                    height: isSmallScreen ? 32 : 40,
                    width: isSmallScreen ? 32 : 40,
                  ),
                  title: Text(
                    _formatDate(day.date),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(day.day.condition.text),
                  trailing: Text(
                    '${day.day.maxTempC.toInt()}° / ${day.day.minTempC.toInt()}°',
                    style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTempSection(bool isSmallScreen) {
    return Column(
      children: [
        Text(
          '${weatherModel.current.tempC.toInt()}°C',
          style: TextStyle(
            fontSize: isSmallScreen ? 40 : 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          weatherModel.current.condition.text,
          style: TextStyle(fontSize: isSmallScreen ? 16 : 18),
        ),
      ],
    );
  }

  Widget _buildIconSection(bool isSmallScreen) {
    return Column(
      children: [
        Image.network(
          'https:${weatherModel.current.condition.icon}',
          height: isSmallScreen ? 64 : 80,
          width: isSmallScreen ? 64 : 80,
        ),
        Text(
          'Feels like ${weatherModel.current.feelsLikeC.toInt()}°C',
          style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
        ),
      ],
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
