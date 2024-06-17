import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pix_resume/bottomtabbar.dart';

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
    Future.delayed(const Duration(seconds: 5),() {
      Get.to(const BottomTabBar());

    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.deepPurpleAccent,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottiefiles/splash_.json',),
              const SizedBox(height: 10),
              const Text("CV Maker",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],
          ),
        ),
      ),
    );
  }
}
