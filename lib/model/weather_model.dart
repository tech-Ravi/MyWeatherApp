class WeatherModel {
  final double temperature;
  final String minMax;
  final String description;
  final String icon;
  final DateTime date;
  final int humidity;
  final double speed;

  const WeatherModel({
    required this.temperature,
    required this.minMax,
    required this.description,
    required this.icon,
    required this.date,
    required this.humidity,
    required this.speed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    //final wind = json['wind'];
    final weather = json['weather'][0];
    final sys = json['sys'];

    return WeatherModel(
      temperature: double.parse((main['temp'] - 273.15).toStringAsFixed(1)),
      minMax: double.parse((main['temp_min'] - 273.15).toStringAsFixed(1))
              .toString() +
          "°C & " +
          double.parse((main['temp_max'] - 273.15).toStringAsFixed(1))
              .toString() +
          "°C",
      description: weather['description'],
      icon: weather['icon'],
      date: DateTime.now(),
      humidity: main['humidity'],
      speed: json['wind']['speed'].toDouble(),
      //speed: wind['speed']
      // speed: double.parse((wind['speed']).toString()),
    );
  }
}
