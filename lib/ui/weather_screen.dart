import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String jsonWeather = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> weatherData = jsonDecode(jsonWeather);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          var cityWeather = weatherData[index];
          return Column(
            children: [
              ListTile(
                title: Text(cityWeather['city'],style: Theme.of(context).textTheme.bodyLarge,),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${cityWeather['temperature']}°C'),
                    Text('Condition: ${cityWeather['condition']}'),
                    Text('Humidity: ${cityWeather['humidity']}%'),
                    Text('Wind Speed: ${cityWeather['windSpeed']} km/h'),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
