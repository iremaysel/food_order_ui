import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/cart_bloc.dart';

import '../../../../../../../core/shared/entities/product.dart';

class DeleteIconButton extends StatelessWidget {
  final Product product;
  const DeleteIconButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Delete ${product.name}?"),
              action: SnackBarAction(
                  label: "Yes",
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(RemovedProductToCartEvent(product));
                  }),
            ),
          );
        },
        icon: const Icon(
          Icons.delete_outline,
          color: Colors.black54,
        ));
  }
}
