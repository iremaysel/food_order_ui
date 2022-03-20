import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/login_page/widgets//text_title.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight!/27.32),    /// 25.0
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight!/2.732,    /// 250.0
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
                    child: SizedBox(
                      width: SizeConfig.screenWidth!/2.74,     /// 150.0
                      height: SizeConfig.screenHeight!/7.762,  /// 88.0
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/main/logo.png')
                            )
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight!/68.3),           /// 10.0
                      child: TextTitle(title: "Welcome Back"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
