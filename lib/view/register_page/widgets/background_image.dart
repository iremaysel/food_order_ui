import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/login_page/widgets/text_title.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight!/4.268,    /// 160.0
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/main/background_image.png'),
                    fit: BoxFit.fill
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextTitle(title: "Create Account"),
                ),
              ],
            ),
          )
        ],
      ),
    );;
  }
}
