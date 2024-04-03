import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/binding_controller.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/add_details_pages/skills_name.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  DetailsController detailsController = Get.find();
  final _formKey = GlobalKey<FormState>();

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
        title: const Text("Skills",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Skill Name",
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
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your skill';
                      //   }
                      //   return null;
                      // },
                      // maxLines: 4,
                      readOnly: true,
                      onTap: () async {
                        var skillResult = await Get.to(const SkillsName(),
                            binding: BindingController());
                        if (skillResult != null) {
                          detailsController.skills.text = skillResult;
                        }
                      },
                      controller: detailsController.skills,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Select Your Skill ",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10)),
                    )),
                const SizedBox(
                  height: 15,
                ),
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
            //   Get.back();
            // }
            if (detailsController.skills.text.isEmpty) {
              detailsController.showValidator(msg: "Select Your Skills");
            } else {
              Get.back();
            }
            debugPrint(detailsController.skills.text);
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
