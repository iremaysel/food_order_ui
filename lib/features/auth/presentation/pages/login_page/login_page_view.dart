import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authetication/authentication_bloc.dart';
import '../../bloc/cubit/login_text_fields_helper_cubit.dart';
import '../../bloc/login/login_bloc.dart';
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
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const LogoImage(),
          Form(key: _formKey, child: const LoginTextField()),
          const ForgotPassword(),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSussess) {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LoggedIn(user: state.user, token: state.token));
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
              if (state is LoginError) {
                Navigator.pop(context);
                SnackBar snackBar = SnackBar(content: Text(state.message!));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Builder(builder: (context) {
              final state = context.watch<LoginTextFieldsHelperCubit>().state;

              return AuthButonColor(
                  buttonText: 'Iniciar Sessión',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginBloc.add(LoginButtonPressed(
                          email: state.email, password: state.password));
                    }
                  });
            }),
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
