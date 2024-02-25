import 'package:flutter/material.dart';
import 'package:flutter_my_weather_app/pages/search_page/search_page_widgets/search_button.dart';

class CityFormField extends StatefulWidget {
  const CityFormField({
    super.key,
    required this.searchController,
    required this.textFontSize,
  });

  final TextEditingController searchController;
  final double textFontSize;

  @override
  State<CityFormField> createState() => _CityFormFieldState();
}

class _CityFormFieldState extends State<CityFormField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: TextStyle(fontSize: widget.textFontSize),
          cursorColor: Colors.blue,
          controller: widget.searchController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            suffixIcon: SearchButton(
              searchController: widget.searchController,
              formKey: _formKey,
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
            hintText: "Search City",
            hintStyle: TextStyle(
              fontSize: widget.textFontSize,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
