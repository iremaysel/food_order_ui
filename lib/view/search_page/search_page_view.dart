import 'package:flutter/material.dart';
import 'package:food_order_ui/view/search_page/widgets/past_search.dart';
import 'package:food_order_ui/view/search_page/widgets/recent_search.dart';
import 'package:food_order_ui/view/search_page/widgets/search_textfield.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title : Text("Search", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          SearchTextField(hint_text: "Search"),
          RecentSearch(),
          PastSearch(search_text: "Grillled Chicken"),
          PastSearch(search_text: "Organic Orange"),
        ],
      ),
    );
  }
}
