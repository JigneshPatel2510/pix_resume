import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pix_resume/Controllers/binding_controller.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/add_details_pages/certificates.dart';
import 'package:pix_resume/add_details_pages/contact_details.dart';
import 'package:pix_resume/add_details_pages/education.dart';
import 'package:pix_resume/add_details_pages/language.dart';
import 'package:pix_resume/add_details_pages/personal_details.dart';
import 'package:pix_resume/add_details_pages/skills.dart';
import 'package:pix_resume/add_details_pages/summary.dart';
import 'package:pix_resume/add_details_pages/work_experience.dart';
import 'package:http/http.dart' as http;

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  DetailsController detailsController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // detailsController.showPreview();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        title: const Text("Add Details",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900)),
        actions: const [
          Icon(
            Icons.more_horiz_rounded,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              fieldItem(
                imagePath: "assets/icons/ic_user.png",
                onTap: (){
                  Get.to(const PersonalDetails(),binding: BindingController());
                },
                subTitle:"Input your personal detail, including your full name and designation.",
                title: "Personal Details"
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              fieldItem(
                onTap: () {
                  Get.to(const ContactDetails());
                } ,
                imagePath: "assets/icons/ic_letter.png",
                title: "Contact Details",
                subTitle:"Input your mobile number, address, Social media link, and your email address."

              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              fieldItem(
                onTap: () {
                  Get.to(const Summary());
                },
                imagePath: "assets/icons/ic_left-align.png",
                title:"Summary",
                subTitle: "Summarize your professional background. Highlight your skill,expertise, and industry experience.",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),

              fieldItem(
                onTap:() {
                  Get.to(const WorkExperience());
                },
                imagePath: "assets/icons/ic_briefcase.png",
                title: "Work Experience",
                subTitle: "Enter your past working experience , responsibilities,achievements, and measurable outcomes",


              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),

              fieldItem(
                onTap: () {
                  Get.to(const Education());
                },
                imagePath:"assets/icons/ic_education.png",
                title: "Education",
                subTitle: "Enter any colleges,universities or training programs that you have attended",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),

              fieldItem(
                onTap: () {
                  Get.to(const Skills());
                },
                imagePath: "assets/icons/ic_skills.png",
                title: "Skills",
                subTitle: "Enter 3-4 skills",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),

              fieldItem(
                onTap: () {
                  Get.to(const Certificates());
                },
                imagePath:"assets/icons/ic_certification.png",
                title: "Certificates",
                subTitle:"Enter your certificate details",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),

              fieldItem(
                onTap:() {
                  Get.to(const Languages());
                },
                imagePath: "assets/icons/ic_languages.png",
                title: "Languages",
                subTitle: "Enter your languages",
              ),




              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: () {
          detailsController.showPreview();



        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color(0xff0D74FF),
            ),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Icon(Icons.remove_red_eye_outlined,color: Colors.white,size: 25),
            )),
      ) ,
    );
  }


  Widget fieldItem({imagePath,title,subTitle,Function()?onTap}){
    return InkWell (
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: SizedBox(
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(25),
        //     border: Border.all(color: Colors.black26)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(width: 15,),
                // Image.asset("assets/icons/ic_six_dot.png",
                //     height: 30, width: 30, color: Colors.black54),
                Image.asset("$imagePath",
                    height: 20,
                    width: 20,
                    color: const Color(0xff0D74FF)),
                const SizedBox(
                  width: 15,
                ),
                 Text(
                  "$title",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 15),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 25),
              child: Text(
                "$subTitle",
                style:
                TextStyle(color: Colors.grey.shade500, fontSize: 11),
              ),
            ),
            const SizedBox(
              height: 15,
            ),


          ],
        ),
      ),
    );
  }



}
