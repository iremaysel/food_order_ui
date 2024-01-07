import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/presentation/bloc/authetication/authentication_bloc.dart';
import '../components/size_config.dart';
import 'cart_icon_count.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 8,
        SizeConfig.blockSizeVertical! * 2.5,
        SizeConfig.blockSizeHorizontal! * 8,
        SizeConfig.blockSizeVertical! * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state is AuthenticationAuthenticated) {
                        return SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 50,
                          child: AutoSizeText(
                            "Hola ${state.user.fullName}",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal! * 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        );
                      } else {
                        return Text(
                          "Hola Usuario",
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal! * 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 4,
                    width: SizeConfig.blockSizeHorizontal! * 8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/main/waving-hand.png"))),
                  )
                ],
              ),
              Text(
                "Tienes Hambre?",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
                    color: Colors.black54),
              )
            ],
          ),
          const CartIconCount(),
        ],
      ),
    );
  }
}
