import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../payments/presentation/pages/cart_page/cart_view.dart';
import '../../products/presentation/pages/favorite_page/favorite_page_view.dart';
import '../../products/presentation/pages/home_page/components/colors.dart';
import '../../products/presentation/pages/home_page/components/size_config.dart';
import '../../products/presentation/pages/home_page/home_page_view.dart';
import '../../search_products/presentation/pages/search_page/search_page_view.dart';
import '../../user_profile/presentation/pages/profile_page/profile_page_view.dart';
import '../bloc/cubit/nav_bar_cubit_cubit.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  // int index = 0;
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavBarCubitCubit(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: BlocBuilder<NavBarCubitCubit, NavBarCubitState>(
            builder: (context, state) {
              return screen[state.index];
            },
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: BlocBuilder<NavBarCubitCubit, NavBarCubitState>(
              builder: (context, state) {
                return CurvedNavigationBar(
                  key: navigationKey,
                  color: Colors.black45,
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor: buttonColor,
                  height: SizeConfig.blockSizeVertical! * 8,
                  animationCurve: Curves.easeInOut,
                  animationDuration: const Duration(milliseconds: 400),
                  index: state.index,
                  items: items,
                  onTap: (index) =>
                      context.read<NavBarCubitCubit>().updateIndexNavBar(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
