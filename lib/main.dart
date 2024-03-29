import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pix_resume/Controllers/binding_controller.dart';
import 'package:pix_resume/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        fontFamily:"Poppins"
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingController(),
      home: const Splash(),
    );
  }
}
