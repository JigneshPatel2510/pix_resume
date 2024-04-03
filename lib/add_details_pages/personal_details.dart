import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();
  // final ImagePicker picker = ImagePicker();

  DetailsController detailsController = Get.find();

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
        title: const Text("Personal Details",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Profile Photo",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                        fontSize: 12),
                  ),
                ),

                /*

                Profile Image...

                 */


                detailsController.pImage != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(detailsController.pImage!.path),
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Image.asset(
                                "assets/images/edit-profile.png",
                              ),
                            ),
                          ),
                        ),
                      ),

                Center(
                    child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () async {
                          bool isRefresh = await detailsController.pickImage();
                          if (isRefresh) {
                            setState(() {});
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: detailsController.pImage != null
                              ? const Text(
                                  "Change Your Profile Photo",
                                  style: TextStyle(color: Color(0xff0D74FF)),
                                )
                              : const Text(
                                  "Select Your Profile Photo",
                                  style: TextStyle(color: Color(0xff0D74FF)),
                                ),
                        ))),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Full Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                        fontSize: 12),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: TextFormField(
                      // onChanged: (value) {
                      //   _formKey.currentState!.validate();
                      // },
                      // validator: (value) {
                      //   if(value==null || value.isEmpty){
                      //     return "Please enter your name";
                      //   }
                      //   return null;
                      // },
                      controller: detailsController.fullName,
                      decoration: InputDecoration(
                          hintText: "Enter Your Full Name",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10)),
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Designation",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                        fontSize: 12),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: TextFormField(
                      // onChanged: (value) {
                      //   _formKey.currentState!.validate();
                      // },
                      // validator: (value) {
                      //   if(value==null || value.isEmpty){
                      //     return "Please enter your designation";
                      //   }
                      //   return null;
                      // },
                      controller: detailsController.designation,
                      decoration: InputDecoration(
                          hintText: "Enter Your Designation",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10)),
                    )),
              ],
            ),
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
            // if (_formKey.currentState!.validate()){
            //   if(detailsController.pImage!=null){
            //     Get.back();
            //   }else{
            //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         duration: Duration(seconds: 2),
            //
            //         content: Text("Please Select Profile Photo.")));
            //   }
            //
            // }
            if(detailsController.fullName.text.isEmpty){
              detailsController.showValidator(msg: "Enter Your Name");
            }else if(detailsController.designation.text.isEmpty){
              detailsController.showValidator(msg: "Enter Your Designation");
            }else if(detailsController.pImage==null){
              detailsController.showValidator(msg: "Select Your Profile Photo");
            }else{
              Get.back();
            }
            debugPrint(detailsController.fullName.text);
            debugPrint(detailsController.designation.text);
          },
          child: Material(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xff0D74FF),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text("Save",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontWeight: FontWeight.w900,
                            fontSize: 20)))),
          ),
        ),
      ),
    );
  }


}
