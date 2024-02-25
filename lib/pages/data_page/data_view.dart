import 'package:flutter/material.dart';
import 'package:flutter_my_weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page_widgets_regular/data_page_content.dart';
class DataView extends StatelessWidget {
  const DataView({
    super.key,
    required this.cityName,
    required this.state,
  });

  final String cityName;
  final SearchedState state;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, boxConstraints) {
        return DataPageContent(cityName: cityName, state: state);
      },
    );
  }
}
