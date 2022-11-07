import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_order_ui/features/main_components/widgets/login_button_widget.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:lottie/lottie.dart';

import '../../../../auth/presentation/bloc/authetication/authentication_bloc.dart';
import '../../../../auth/presentation/pages/login_page/login_page_view.dart';
import '../../../../main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import 'widgets/top_custom_shape.dart';
import 'widgets/user_sections.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Scaffold(
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  appBar: AppBar(
                    leading: GestureDetector(
                        onTap: () => context
                            .read<NavBarCubitCubit>()
                            .updateIndexNavBar(0),
                        child: const Icon(Icons.arrow_back)),
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
                      UserSection(
                          onTap: () {
                            context.read<AuthenticationBloc>().add(LoggedOut());
                          },
                          iconName: Icons.logout_outlined,
                          sectionText: "Cerrar Session"),
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
