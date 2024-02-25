import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/humidity_page_content.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/icon_degree_banner.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/min_max_information.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/place_data_time_information.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/weather_description.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/wind_speed_content.dart';


import '../../../blocs/weather_bloc/weather_bloc.dart';

class DataPageContent extends StatelessWidget {
  const DataPageContent({
    super.key,
    required this.cityName,
    required this.state,
  });

  final String cityName;
  final SearchedState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlaceDataTimeInformation(
                cityName: cityName,
                date: state.weatherModel.date,
              ),
              const SizedBox(
                height: 30,
              ),
              IconDegreeBanner(
                icon: state.weatherModel.icon,
                temperature: state.weatherModel.temperature,
              ),
              const SizedBox(
                height: 30,
              ),
              WeatherDescription(
                description: state.weatherModel.description,
              ),
              const SizedBox(
                height: 40,
              ),
              MinMaxInformation(
                minMax: state.weatherModel.minMax,
              ),
              HumiditySimplified(
                humidity: state.weatherModel.humidity,
              ),
              WindSpeedSimplefied(speed: state.weatherModel.speed),
            ],
          ),
        ),
      ),
    );
  }
}
