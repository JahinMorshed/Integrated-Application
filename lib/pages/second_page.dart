import 'package:flutter/material.dart';
import 'package:my_portfolio/weather/weather_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: const WeatherPage(),
    );
  }
}
