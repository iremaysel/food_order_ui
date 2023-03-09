import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import 'widgets/past_search.dart';
import 'widgets/recent_search.dart';
import 'widgets/search_textfield.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<NavBarCubitCubit>().updateIndexNavBar(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () =>
                  context.read<NavBarCubitCubit>().updateIndexNavBar(0),
              child: const Icon(Icons.arrow_back)),
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
      ),
    );
  }
}
