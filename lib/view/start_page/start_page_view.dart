import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/login_page/widgets/text_title.dart';

import 'widgets/start_page_body_login_button.dart';
import 'widgets/start_page_sing_up_button.dart';

class StartPageView extends StatelessWidget {
  const StartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: const [
          _PageBackGround(),
          _PageBody(),
        ],
      ),
    );
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _PageBodyLogo(),
        _PageBodyTexts(),
        StartPageBodyLoginButton(),
        StartPageBodySingUpButton(),
      ],
    );
  }
}

class _PageBodyTexts extends StatelessWidget {
  const _PageBodyTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        SizeConfig.blocksizeVertical! * 3,
        0,
        SizeConfig.blocksizeVertical! * 8,
      ),
      child: Column(children: [
        const Center(
          child: TextTitle(
            title: "Bienvenidos",
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 10,
              vertical: SizeConfig.blocksizeVertical! * 1),

          /// 40.0 - 5.0
          child: const Center(
            child: Text(
              "Bienvenidos a nuetra paladar LA MACIAS donde encontrara las mejores ofertas de Pinar",
              style: TextStyle(color: Colors.white60),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    );
  }
}

class _PageBodyLogo extends StatelessWidget {
  const _PageBodyLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal! * 45,
      height: SizeConfig.blocksizeVertical! * 20,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/main/logo.png",
              ),
              fit: BoxFit.cover)),
    );
  }
}

class _PageBackGround extends StatelessWidget {
  const _PageBackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/main/bg.png'), fit: BoxFit.fill)),
    );
  }
}
