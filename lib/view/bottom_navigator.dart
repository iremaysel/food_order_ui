import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_order_ui/view/cart_page/cart_view.dart';
import 'package:food_order_ui/view/favorite_page/favorite_page_view.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/home_page/home_page_view.dart';
import 'package:food_order_ui/view/profile_page/profile_page_view.dart';
import 'package:food_order_ui/view/search_page/search_page_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [
    const HomePageView(),
    const SearchPageView(),
    const CartView(),
    const FavoritePageView(),
    const ProfilePageView(),
  ];
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SizeConfig().init(context);
    final items = [
      Icon(Icons.home, size: SizeConfig.blockSizeHorizontal! * 8.5),

      /// 30.0
      Icon(Icons.search, size: SizeConfig.blockSizeHorizontal! * 8.5),
      Icon(Icons.shopping_cart, size: SizeConfig.blockSizeHorizontal! * 8.5),
      Icon(Icons.favorite, size: SizeConfig.blockSizeHorizontal! * 8.5),
      Icon(Icons.person, size: SizeConfig.blockSizeHorizontal! * 8.5),
    ];

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: screen[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.black45,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: buttonColor,
            height: SizeConfig.blockSizeVertical! * 8,

            /// 60.0
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 400),
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
      ),
    );
  }
}
