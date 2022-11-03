import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/auth/presentation/pages/bloc/authetication/authentication_bloc.dart';

import '../../../../../auth/presentation/pages/bloc/login/login_bloc.dart';
import '../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../components/CustomShape.dart';

class TopCustomShape extends StatelessWidget {
  const TopCustomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 32,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: SizeConfig.blockSizeVertical! * 22,

              /// 150.0
              color: buttonColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 22,

                  /// 140.0
                  width: SizeConfig.blockSizeHorizontal! * 35,

                  /// 140.0
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: SizeConfig.blockSizeHorizontal! * 1,
                      ),
                      color: Colors.white,
                      image: const DecorationImage(
                          image: AssetImage("assets/main/avatar.png"))),
                ),
                Builder(builder: (context) {
                  final state = context.watch<LoginBloc>().state;
                  final state2 = context.watch<AuthenticationBloc>().state;
                  if (state is LoginSussess) {
                    return Text(
                      state.user.fullName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black45),
                    );
                  }
                  if (state2 is AuthenticationUnauthenticated) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 6.0),
                        child: Text(
                          'Debe iniciar session para modificar el perfil',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 6.0),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                SizedBox(
                  height: SizeConfig.screenHeight! / 136.6,
                ),

                /// 5.0
                Builder(
                  builder: (context) {
                    final state = context.watch<LoginBloc>().state;
                    final state2 = context.watch<AuthenticationBloc>().state;
                    if (state is LoginSussess) {
                      return Text(
                        state.user.email,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black45),
                      );
                    }
                    if (state2 is AuthenticationUnauthenticated) {
                      return const SizedBox();
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
