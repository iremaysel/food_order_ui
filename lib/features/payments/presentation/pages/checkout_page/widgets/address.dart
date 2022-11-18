import 'package:flutter/material.dart';

import '../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../components/checkout_textfield.dart';
import '../components/page_name.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 6,
              child: TabBar(
                labelPadding:
                    EdgeInsets.all(SizeConfig.blockSizeVertical! * 1.2),
                splashBorderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeVertical! * 1)),
                labelStyle:
                    TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 5),
                indicator: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          offset: Offset(0, 2)),
                    ],
                    border: Border.all(color: buttonColor),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockSizeVertical! * 1))),
                tabs: const [
                  Tab(
                    child: Text('Envio'),
                  ),
                  Tab(
                    child: Text('Local'),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.blockSizeVertical! * 60,
              child: const TabBarView(children: [
                _EnvioTabBarBody(),
                _LocalTabBarBody(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class _LocalTabBarBody extends StatelessWidget {
  const _LocalTabBarBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        const LabelName(textName: "Numero de Mesa"),
        const CheckoutTextField(
          enterText: "Escribe el numero de la mesa",
          sizewidth: 1.18,
        ),
      ],
    );
  }
}

class _EnvioTabBarBody extends StatelessWidget {
  const _EnvioTabBarBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          const LabelName(textName: "Nombre"),
          const CheckoutTextField(
            enterText: "Escribe su nombre completo",
            sizewidth: 1.18,
          ), //350
          const LabelName(textName: "Email"),
          const CheckoutTextField(
            enterText: "Escriba su email",
            sizewidth: 1.18,
          ),
          const LabelName(textName: "Teléfono"),
          const CheckoutTextField(
            enterText: "Escriba su numero de teléfono",
            sizewidth: 1.18,
          ),
          const LabelName(textName: "Dirección"),
          const CheckoutTextField(
            enterText: "Escriba su dirección",
            sizewidth: 1.18,
          ),
          const LabelName(textName: "Referencia"),
          const CheckoutTextField(
            enterText: "Escriba aqui la referencia",
            sizewidth: 1.18,
          ),
        ],
      ),
    );
  }
}
