import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pix_resume/add_details.dart';
import 'package:pix_resume/templatestab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 0,
        title: const Row(
          children: [
            Text(
              "Pix",
              style: TextStyle(color: Color(0xff0D74FF),fontWeight: FontWeight.w900),
            ),
            SizedBox(width: 5),
            Text(
              "Resume",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),
            )
          ],
        ),
        actions: [
          Image.asset(
            "assets/icons/ic_premium.png",
            height: 35,
            width: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/icons/ic_profile.png",
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1.5, color: Colors.grey.shade200)),
              child: ListTile(
                leading: const Icon(Icons.tips_and_updates_rounded,
                    color: Color(0xff0D74FF)),
                title: const Text("Tips for your resume",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: 15, color: Colors.grey.shade400),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("My Resume",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900)),
                ),
                Spacer(),
                Text("See all",style: TextStyle(color: Color(0xff0D74FF),fontWeight: FontWeight.w900),)
              ],
            )
          ],
        ),
      ),
      floatingActionButton:InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: () {
          Get.to( const TemplatesPage());
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color(0xff0D74FF),
            ),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Icon(Icons.add,color: Colors.white,size: 25),
            )),
      ) ,
    );
  }
}
