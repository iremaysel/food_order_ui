import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';
import 'package:food_order_ui/features/search_products/presentation/pages/search_page/search_page_view.dart';

class SearchFood extends StatelessWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal! * 10,
          vertical: SizeConfig.blockSizeVertical! * 2,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchPageView()));
          },
          child: Container(
              height: SizeConfig.blockSizeVertical! * 6,
              width: SizeConfig.blockSizeHorizontal! * 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeHorizontal! * 5.5)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.3),
                    )
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black26,
                    ),
                  ),
                  Text("Buscar",
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5))

                  /// 16
                ],
              )),
        ),
      ),
    );
  }
}
