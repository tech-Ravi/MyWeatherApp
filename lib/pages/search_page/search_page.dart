import 'package:flutter/material.dart';
import 'package:flutter_my_weather_app/pages/search_page/search_page_widgets/search_page_content_regular.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffeeeeee),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (BuildContext, BoxConstraints) {
            return SearchPageContentRegular(
              searchController: searchController,
            );
          },
        ),
      ),
    );
  }

  refreshPage() {
    setState(() {});
  }
}
