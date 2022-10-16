import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class UserNameText extends StatelessWidget {
  final String username;

  const UserNameText({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 8,
        SizeConfig.blocksizeVertical! * 2.5,
        SizeConfig.blockSizeHorizontal! * 8,
        SizeConfig.blocksizeVertical! * 3,
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blocksizeVertical! * 1,
                        bottom: SizeConfig.blocksizeVertical! * 1),

                    child: Text(
                      "Hola $username",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),

                    /// 23
                  ),
                  Container(
                    height: SizeConfig.blocksizeVertical! * 4,

                    /// 30.0
                    width: SizeConfig.blockSizeHorizontal! * 10,

                    /// 30.0
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/main/waving-hand.png"))),
                  )
                ],
              ),
              Text(
                "Are you hungry?",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
                    color: Colors.black54),
              )

              /// 17
            ],
          ),
          Stack(
            children: [
              Container(
                height: SizeConfig.blocksizeVertical! * 6,

                /// 40.0
                width: SizeConfig.blockSizeHorizontal! * 20,

                /// 80.0
                decoration: BoxDecoration(
                    color: lightColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal! * 10)),
              ),
              Positioned(
                left: SizeConfig.blockSizeHorizontal! * 0.25,
                child: Container(
                    height: SizeConfig.blocksizeVertical! * 6,

                    /// 40.0
                    width: SizeConfig.blockSizeHorizontal! * 11,

                    /// 40.0
                    decoration: BoxDecoration(
                        color: buttonColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeHorizontal! * 20)),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                  right: SizeConfig.blockSizeHorizontal! * 4,

                  /// 20.0
                  bottom: SizeConfig.blocksizeVertical! * 1.9, //

                  /// 11.0
                  child: const Text(
                    "3",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
