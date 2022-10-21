import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  final String foodName;
  const DeleteIconButton({Key? key, required this.foodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Delete $foodName?"),
              action: SnackBarAction(label: "Yes", onPressed: () {}),
            ),
          );
        },
        icon: const Icon(
          Icons.delete_outline,
          color: Colors.black54,
        ));
  }
}
