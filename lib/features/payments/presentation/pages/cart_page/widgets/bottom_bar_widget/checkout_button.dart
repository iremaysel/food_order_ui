import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/auth/presentation/pages/login_page/login_page_view.dart';

import '../../../../../../auth/presentation/bloc/login/login_bloc.dart';
import '../../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../../../checkout_page/checkout_page_view.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSussess) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CheckoutPageView()));
            },
            child: Container(
                height: SizeConfig.blockSizeVertical! * 7.5,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Pagar Ahora",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal! * 6,
                      fontWeight: FontWeight.bold),

                  /// 20.0
                ))),
          );
        } else {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPageView()));
            },
            child: Container(
                height: SizeConfig.blockSizeVertical! * 7.5,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Login para Pagar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal! * 6,
                      fontWeight: FontWeight.bold),

                  /// 20.0
                ))),
          );
        }
      },
    );
  }
}
