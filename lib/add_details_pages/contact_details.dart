import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final _formKey = GlobalKey<FormState>();
  DetailsController detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        title: const Text("Contact Details",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Email",
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
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Please enter your e-mail";
                      }
                      return null;
                    },
                    controller: detailsController.email,
                    decoration: InputDecoration(
                        hintText: "Enter Your Email Address",
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
                  "Social Media Link",
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
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return"Please fill your social media link";
                      }
                    },
                    controller: detailsController.socialMediaLink,
                    decoration: InputDecoration(
                        hintText: "Enter Your Social Media Link",
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
                  "Mobile Number",
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
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Please enter your mobile number";
                      }
                    },
                    maxLength: 10,
                    controller: detailsController.mobileNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "",
                        hintText: "Enter Your Mobile Number",
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
                  "Address",
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
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Please enter your address";
                      }
                    },
                    controller: detailsController.address,
                    decoration: InputDecoration(
                        hintText: "Enter Your Address",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10)),
                  )),
              const SizedBox(
                height: 15,
              ),
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
            if (_formKey.currentState!.validate()){
              Get.back();
            }

            debugPrint(detailsController.email.text);
            debugPrint(detailsController.socialMediaLink.text);
            debugPrint(detailsController.mobileNumber.text);
            debugPrint(detailsController.address.text);
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
