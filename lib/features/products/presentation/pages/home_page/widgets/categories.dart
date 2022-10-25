import 'package:flutter/material.dart';
import 'package:food_order_ui/core/util/category.dart';
import 'package:food_order_ui/core/util/food_list.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class CategoriesFood extends StatelessWidget {
  const CategoriesFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: bringTheCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categoryList = snapshot.data;
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 12,
            child: ListView.builder(
              //  physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoryList!.length,
              itemBuilder: (context, indeks) {
                var category = categoryList[indeks];
                return Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical! * 1,
                      bottom: SizeConfig.blockSizeVertical! * 1,
                      left: SizeConfig.blockSizeHorizontal! * 4),
                  child: GestureDetector(
                    onTap: () =>
                        print('tocaste la categoria ${category.categoryName}'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical! * 7,

                          /// 45.0
                          width: SizeConfig.blockSizeHorizontal! * 13,

                          /// 45.0
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(category.categoryImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          category.categoryName,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
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
