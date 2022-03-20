import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login_page/login_page_view.dart';
import 'package:food_order_ui/view/start_page/start_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/main/splashscreen.gif"),
              fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
