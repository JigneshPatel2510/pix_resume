import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class GoPremium extends StatefulWidget {
  const GoPremium({super.key});

  @override
  State<GoPremium> createState() => _GoPremiumState();
}

class _GoPremiumState extends State<GoPremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
         backgroundColor: Colors.transparent,
         leading: InkWell(
           borderRadius: BorderRadius.circular(30),
             onTap: () {
               Get.back();
             },
             child: const Icon(Icons.arrow_back,color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Image.asset(
                  "assets/icons/ic_crown(2).png",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            const Text("Go Premium",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            Text("Select the offer the best suits your need",style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
            const SizedBox(height: 50,),


            const Text("Coming Soon...",style: TextStyle(fontSize: 15),)


          ],
        ),
      ),
    );
  }
}
