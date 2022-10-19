import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/authPages/login_page/widgets/text_title.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 6),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical! * 40,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/main/background_image.png'),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 40,

                    /// 150.0
                    height: SizeConfig.blockSizeVertical! * 10,

                    /// 88.0
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/main/logo.png'))),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 2),

                    /// 10.0
                    child: const TextTitle(title: "Bienvenidos"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
