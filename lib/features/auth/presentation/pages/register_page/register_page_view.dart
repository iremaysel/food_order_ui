import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

import '../../../../main_components/pages/bottom_navigator.dart';
import '../../bloc/authetication/authentication_bloc.dart';
import '../../bloc/cubit/login_text_fields_helper_cubit.dart';
import '../../bloc/register/register_bloc.dart';
import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../login_page/login_page_view.dart';
import 'widgets/background_image.dart';
import 'widgets/text_field.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerBloc = BlocProvider.of<RegisterBloc>(context);
    var authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    var _formkey = GlobalKey<FormState>();
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSussess) {
          authenticationBloc
              .add(LoggedIn(user: state.user, token: state.token));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        }
        if (state is RegisterLoading) {
          showDialog(
              context: context,
              builder: ((context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }));
        }
        if (state is RegisterError) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(
              content: state.message == null
                  ? const Text('Ha ocurrido algun error en el server')
                  : Text(state.message!));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const BackgroundImage(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
                  const RegisterTextField(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 10,
                  ),
                  BlocBuilder<LoginTextFieldsHelperCubit,
                      LoginTextFieldsHelperState>(
                    builder: (context, state) {
                      return AuthButonColor(
                          buttonText: 'Iniciar Session',
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              registerBloc.add(RegisterButtonPressed(
                                  fullname: state.username,
                                  email: state.email,
                                  password: state.password));
                            }
                          });
                    },
                  ),
                  TextSignUpOrSingIn(
                    phrase: 'Ya tines una cuenta! ',
                    singInOrSingUpText: 'Iniciar Sessión',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPageView())),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
