import 'package:flutter/material.dart';

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
  String temperature = 'N/A';
  String weatherCondition = 'N/A';

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