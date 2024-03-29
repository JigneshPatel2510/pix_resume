import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/items/education_items.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
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
        title: const Text("Education",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Degree Name",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.degreeName,
                    decoration: InputDecoration(
                        hintText: "Enter Your Degree Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Institute Name",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.instituteName,
                    decoration: InputDecoration(
                        hintText: "Enter Your Institute Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Institute Address",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.instituteAddress,
                    decoration: InputDecoration(
                        hintText: "Enter Institute Address",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Degree Year",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.degreeYear,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Your Degree Year",
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
                    controller: detailsController.degreeDescription,
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
                      detailsController.addEducation();
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
                itemCount: detailsController.education.length,
                itemBuilder: (context, index) {
                return EducationItems(index: index,data: detailsController.education[index],);
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
            debugPrint(detailsController.degreeName.text);
            debugPrint(detailsController.instituteName.text);
            debugPrint(detailsController.instituteAddress.text);
            debugPrint(detailsController.degreeYear.text);
            debugPrint(detailsController.degreeDescription.text);

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
