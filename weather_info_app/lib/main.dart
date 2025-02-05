import 'package:flutter/material.dart';
import "dart:math";
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'WeatherApp';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const WeatherForm(),
      ),
    );
  }
}

class WeatherForm extends StatefulWidget {
  const WeatherForm({super.key});

  @override
  State<WeatherForm> createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  final TextEditingController _cityController = TextEditingController();
  String cityName = '';
  var temperature = Random().nextInt(10);
  var weather = ['Rainy', 'Sunny', 'Cloudy', 'Partly Cloudy', 'Snowing', 'Windy'];
  var weatherCondition = "None";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter city name',
            ),
            onChanged: (text) {
              setState(() {
                cityName = text;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                temperature = Random().nextInt(10);
                weatherCondition = weather[Random().nextInt(weather.length)];
              });
            },
            child: const Text("See Weather")
          ),
          const SizedBox(height: 20),
          const Text(
            'Weather Information:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('City: $cityName'),
          Text('Temperature: $temperature'),
          Text('Condition: $weatherCondition'),
        
        ],
      ),
    );
  }
}
class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => FetchWeather();
}

class FetchWeather extends State<ElevatedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              
            },
            child: const Text('See Weather'),
          ),
        ],
      ),
    );
  }
}