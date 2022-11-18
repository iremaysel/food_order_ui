import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/domain/entities/category.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/category/category_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_by_category.dart/product_by_category_bloc.dart';
import 'package:food_order_ui/features/products/presentation/pages/category_page/category_page.dart';

import '../../../../data/models/category_model.dart';
import '../components/size_config.dart';

class CategoriesFood extends StatelessWidget {
  const CategoriesFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoryLoadedState) {
          var categoryList = state.categories;
          return CategoriesCustomWidget(categoryList: categoryList);
        } else {
          return const Text("error");
        }
      },
    );
  }
}

class CategoriesCustomWidget extends StatelessWidget {
  const CategoriesCustomWidget({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  final List<Category> categoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          Category category = categoryList[index];

          return Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical! * 1,
                bottom: SizeConfig.blockSizeVertical! * 1,
                left: SizeConfig.blockSizeHorizontal! * 4),
            child: GestureDetector(
              onTap: () {
                context.read<ProductByCategoryBloc>().add(
                    ProductByCategoriesRequestedEvent(
                        category: category as CategoryModel));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryPageView(category: category)));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: SizeConfig.blockSizeVertical! * 8,
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      child: category.image == 'isci.svg'
                          ? Image.asset('assets/category/recurso4.png')
                          : Image(
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset('assets/category/recurso4.png'),
                              image: AssetImage(
                                  'assets/category/${category.image}'))),
                  Text(
                    category.name,
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
  }
}
