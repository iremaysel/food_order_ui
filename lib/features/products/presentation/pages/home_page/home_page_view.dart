import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/platform/network/bloc/internet_bloc.dart';
import '../../widgets/food_part.dart';
import 'components/size_config.dart';
import 'widgets/categories.dart';
import 'widgets/discount_card.dart';
import 'widgets/popular.dart';
import 'widgets/recommed.dart';
import 'widgets/search_food.dart';
import 'widgets/username_text.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          SnackBar snackBar =
              const SnackBar(content: Text('El dispositivo no tiene internet'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is InternetConnected) {
          SnackBar snackBar =
              const SnackBar(content: Text('De nuevo en Linea'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              UserNameText(),
              SearchFood(),
              DiscountCard(),
              FoodPart(partName: "Categorias"),
              CategoriesFood(),
              FoodPart(partName: "Recomendados"),
              RecommedFoods(),
              FoodPart(partName: "Nuestros Productos"),
              PopularFoods(),
              //Done..
            ],
          ),
        ),
      ),
    );
  }
}
