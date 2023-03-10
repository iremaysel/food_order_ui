import 'package:flutter/material.dart';
import '../../../products/presentation/pages/home_page/components/size_config.dart';

class PastSearch extends StatelessWidget {
  final String searchText;
  const PastSearch({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 5,
        vertical: SizeConfig.blockSizeVertical! * 1,
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.black38),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 4,
          ),
          Text(
            searchText,
            style: TextStyle(
              color: Colors.black54,
              fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.cancel,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
