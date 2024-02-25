import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_weather_app/pages/data_page/data_page.dart';

import '../../../blocs/weather_bloc/weather_bloc.dart';


class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.searchController,
    required this.formKey,
  });

  final TextEditingController searchController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 50),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text(
          "Search",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          _searchPageAction(context, formKey);
        },
      ),
    );
  }

  Future<void> _searchPageAction(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final connectivityResult = await (Connectivity().checkConnectivity());
      FocusManager.instance.primaryFocus?.unfocus();
      if (connectivityResult != ConnectivityResult.none) {
        navigator.push(
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<WeatherBloc>(context),
              child: DataPage(
                cityName: searchController.text,
              ),
            ),
          ),
        );
      } else {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('No internet'),
          ),
        );
      }
    }
  }
}
