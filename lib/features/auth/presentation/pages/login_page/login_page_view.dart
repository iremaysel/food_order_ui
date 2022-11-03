import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/auth/presentation/pages/bloc/login/login_bloc.dart';
import 'widgets/text_field.dart';
import '../register_page/register_page_view.dart';
import '../../../../main_components/pages/bottom_navigator.dart';
import 'widgets/forgot_password.dart';
import '../../widgets/login_button.dart';
import 'widgets/logo.dart';
import '../../widgets/text_signup_or_singin.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatelessWidget {
  const _LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const LogoImage(),
          const LoginTextField(),
          const ForgotPassword(),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSussess) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }
              if (state is LoginLoading) {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }));
              }
            },
            child: AuthButonColor(
              buttonText: 'Iniciar Sessión',
              onPressed: () {
                loginBloc.add(const LoginButtonPressed(
                    email: 'email@email.com', password: 'Mangus'));
              },
            ),
          ),
          TextSignUpOrSingIn(
              phrase: "¿No tienes una cuenta? ",
              singInOrSingUpText: 'Registrar',
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPageView(),
                    ),
                  ))
        ],
      ),
    );
  }
}
