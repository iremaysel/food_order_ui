import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/main_components/widgets/login_button_widget.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:lottie/lottie.dart';

import '../../../../auth/presentation/pages/bloc/login/login_bloc.dart';
import '../../../../auth/presentation/pages/login_page/login_page_view.dart';
import 'widgets/top_custom_shape.dart';
import 'widgets/user_sections.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSussess) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    centerTitle: true,
                    elevation: 0,
                    title: const Text(
                      "Perfil",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopCustomShape(),
                      SizedBox(
                        height: constraints.biggest.height * 0.05,
                      ),
                      const UserSection(
                          iconName: Icons.account_circle,
                          sectionText: "My information"),
                      const UserSection(
                          iconName: Icons.credit_card,
                          sectionText: "Credit Card"),
                      const UserSection(
                          iconName: Icons.shopping_basket,
                          sectionText: "Past orders"),
                      const UserSection(
                          iconName: Icons.location_city,
                          sectionText: "Address information"),
                      const UserSection(
                          iconName: Icons.wallet_giftcard,
                          sectionText: "Coupons"),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: Column(
              children: [
                const TopCustomShape(),
                LottieBuilder.asset('assets/main/login_icon.json'),
                LoginButton(
                    textButton: 'Iniciar Session',
                    colorButton: buttonColor,
                    colorTextButton: Colors.white,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPageView())))
              ],
            ),
          );
        }
      },
    );
  }
}
