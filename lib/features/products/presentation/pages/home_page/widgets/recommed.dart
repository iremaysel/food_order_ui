import 'package:flutter/material.dart';
import '../../../../../../core/util/food.dart';
import '../../../../../../core/util/food_list.dart';
import '../components/colors.dart';
import '../components/size_config.dart';

class RecommedFoods extends StatefulWidget {
  const RecommedFoods({Key? key}) : super(key: key);

  @override
  _RecommedFoodsState createState() => _RecommedFoodsState();
}

class _RecommedFoodsState extends State<RecommedFoods> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: bringTheFoods(),
      builder: (context, AsyncSnapshot<List<Food>> snapshot) {
        if (snapshot.hasData) {
          var foodList = snapshot.data;
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 40,

            /// 265.0
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: foodList!.length,
              itemBuilder: (context, index) {
                var food = foodList[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //TODO: Hacer el Navigator de la food//.
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            SizeConfig.blockSizeHorizontal! * 3,
                            SizeConfig.blockSizeVertical! * 1,
                            SizeConfig.blockSizeHorizontal! * 1,
                            SizeConfig.blockSizeVertical! * 1),
                        height: SizeConfig.blockSizeVertical! * 38,
                        width: SizeConfig.blockSizeHorizontal! * 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeHorizontal! * 4),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(4, 6),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.3),
                              )
                            ]),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(food.foodImageName),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeHorizontal! * 4),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeHorizontal! * 4),
                              ),
                            ),
                            Positioned(
                                left: SizeConfig.blockSizeHorizontal! * 3,
                                bottom: SizeConfig.blockSizeVertical! / 0.5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(food.foodName,
                                        style: TextStyle(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400)),
                                    Text(food.foodCategory,
                                        style: TextStyle(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                5,
                                            color: Colors.white)),
                                    Text("\$${food.foodPrice}",
                                        style: TextStyle(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                4.5,
                                            color: lightColor))
                                  ],
                                )),
                            Positioned(
                                top: SizeConfig.blockSizeVertical! * 1.5,
                                right: SizeConfig.blockSizeHorizontal! * 2,
                                child: GestureDetector(
                                  onTap: () {
                                    //TODO: Addicionar el food a la lista de favoritos..
                                  },
                                  child: const Icon(Icons.favorite,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
