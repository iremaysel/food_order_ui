import 'package:flutter/material.dart';

import 'widgets/top_custom_shape.dart';
import 'widgets/user_sections.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: const Text(
                "Perfil",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopCustomShape(),
                SizedBox(
                  height: constraints.biggest.height * 0.05,
                ),
                const UserSection(
                    iconName: Icons.account_circle,
                    sectionText: "My information"),
                const UserSection(
                    iconName: Icons.credit_card, sectionText: "Credit Card"),
                const UserSection(
                    iconName: Icons.shopping_basket,
                    sectionText: "Past orders"),
                const UserSection(
                    iconName: Icons.location_city,
                    sectionText: "Address information"),
                const UserSection(
                    iconName: Icons.wallet_giftcard, sectionText: "Coupons"),
              ],
            ),
          );
        },
      ),
    );
  }
}
