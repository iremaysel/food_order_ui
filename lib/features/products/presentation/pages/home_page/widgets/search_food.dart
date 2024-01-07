import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import '../components/size_config.dart';

class SearchFood extends StatelessWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal! * 10,
          vertical: SizeConfig.blockSizeVertical! * 2,
        ),
        child: InkWell(
          onTap: () => context.read<NavBarCubitCubit>().updateIndexNavBar(1),
          child: Container(
              height: SizeConfig.blockSizeVertical! * 6,
              width: SizeConfig.blockSizeHorizontal! * 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeHorizontal! * 5.5)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.3),
                    )
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black26,
                    ),
                  ),
                  Text("Buscar",
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5))

                  /// 16
                ],
              )),
        ),
      ),
    );
  }
}
