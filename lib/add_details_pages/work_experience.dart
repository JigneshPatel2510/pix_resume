import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/items/experience_item.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  DetailsController detailsController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text("Work Experience",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Company Name",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.companyName,
                    decoration: InputDecoration(
                        hintText: "Enter Company Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Company Address",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.companyAddress,
                    decoration: InputDecoration(
                        hintText: "Enter Company Address",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Level Of Position",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.levelOfPosition,
                    decoration: InputDecoration(
                        hintText: "Enter Your Level Of Position",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Year",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.workYear,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Your Experience Year",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Description",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    maxLines: 3,
                    controller: detailsController.experienceDescription,
                    decoration: InputDecoration(
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),
              const SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      detailsController.addExperience();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D74FF),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                          child: Text("Done",style: TextStyle(color: Colors.white,letterSpacing: .5,fontWeight: FontWeight.w900),),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 15,),

              ListView.builder(
                shrinkWrap: true,
                itemCount: detailsController.experience.length,
                itemBuilder: (context, index) {
                return ExperienceItem(data: detailsController.experience[index],index: index,);
              },)


            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        height: 70,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {









            debugPrint(detailsController.companyName.text);
            debugPrint(detailsController.companyAddress.text);
            debugPrint(detailsController.levelOfPosition.text);
            debugPrint(detailsController.workYear.text);
            debugPrint(detailsController.experienceDescription.text);
          },
          child: Material(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xff0D74FF),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Center(child: Text("Save",style: TextStyle(color: Colors.white,letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 20)))),
          ),
        ),
      ),
    );
  }
}
