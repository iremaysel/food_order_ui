import 'package:flutter/material.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class UserSection extends StatelessWidget {
  final IconData iconName;
  final String sectionText;
  const UserSection(
      {Key? key, required this.iconName, required this.sectionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 8,

        /// 30.0
        0,
        SizeConfig.blockSizeHorizontal! * 6,

        /// 15.0
        SizeConfig.blockSizeVertical! * 3,

        /// 20.0
      ),
      child: Row(
        children: [
          Icon(
            iconName,
            color: Colors.black54,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 6,
          ),
          Text(
            sectionText,
            style: TextStyle(
              color: Colors.black54,
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
            ),
          ),

          /// 16
          const Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black45,
            size: SizeConfig.blockSizeHorizontal! * 10,
          )

          /// 32
        ],
      ),
    );
  }
}
