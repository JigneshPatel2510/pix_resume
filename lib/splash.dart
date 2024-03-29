import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/bottomtabbar.dart';
import 'package:pix_resume/hometab.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      Get.to(const BottomTabBar());

    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/ic_splash.png"),
              SizedBox(height: 10),
              Text("CV Maker",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],
          ),
        ),
      ),
    );
  }
}
