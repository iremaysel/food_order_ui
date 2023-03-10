import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';
import 'package:food_order_ui/features/search/presentation/bloc/cubit_search/cubit/search_texts_field_cubit_cubit.dart';
import 'package:food_order_ui/features/search/presentation/bloc/search_bloc.dart';

import '../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../products/presentation/pages/home_page/components/size_config.dart';

class SearchTextField extends StatefulWidget {
  final String hintText;
  const SearchTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    var searchBloc = BlocProvider.of<SearchBloc>(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 5,
        0,
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blockSizeVertical! * 2,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.blockSizeHorizontal! * 5)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.2),
              )
            ]),
        child: Builder(builder: (context) {
          var productBlocState = context.watch<ProductBloc>().state;
          if (productBlocState is ProductsLoadedState) {
            return TextFormField(
              onChanged: (query) {
                context.read<SearchTextsFieldCubitCubit>().updateQuery(query);

                searchBloc.add(SearchRequestedEvent(
                    query: query, products: productBlocState.productList));
              },
              style: TextStyle(color: textColor),
              cursorColor: textColor,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black26,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeHorizontal! * 5)),
                  borderSide:
                      const BorderSide(width: 1, color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 5),
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.black26),
              ),
            );
          } else {
            return const Text('');
          }
        }),
      ),
    );
  }
}
