import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/features/auth/presentation/pages/login_page/widgets/text_title.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          height: SizeConfig.blockSizeVertical! * 25,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/main/background_image.png'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: TextTitle(title: "Create Account"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
