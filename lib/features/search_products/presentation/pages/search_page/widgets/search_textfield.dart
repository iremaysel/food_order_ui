import 'package:flutter/material.dart';

import '../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  const SearchTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: TextField(
          
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
              borderSide: const BorderSide(width: 1, color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 5),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black26),
          ),
        ),
      ),
    );
  }
}
