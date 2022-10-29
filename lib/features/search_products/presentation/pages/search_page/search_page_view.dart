import 'package:flutter/material.dart';
import 'widgets/past_search.dart';
import 'widgets/recent_search.dart';
import 'widgets/search_textfield.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Buscar",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: const [
          SearchTextField(hintText: "Buscar"),
          RecentSearch(),
          PastSearch(searchText: "Grillled Chicken"),
          PastSearch(searchText: "Organic Orange"),
        ],
      ),
    );
  }
}
