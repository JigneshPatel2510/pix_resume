import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pix_resume/Controllers/details_controller.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  final ImagePicker picker = ImagePicker();
  XFile? image;

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
        title: const Text("Personal Details",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Profile Photo",
                style: TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
              ),
            ),

            /*

            Profile Image...

             */
            Padding(
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
                    child: Image.asset("assets/images/edit-profile.png",
                        ),
                  ),
                ),
              ),
            ),
             Center(child: InkWell(
               borderRadius: BorderRadius.circular(20),
               onTap: () async {
                  image = await picker.pickImage(source: ImageSource.gallery);
               },
                 child: const Padding(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   child: Text("Select Your Profile Photo",style: TextStyle(color:Color(0xff0D74FF) ),),
                 ))),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Full Name",style:TextStyle(
                  fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade400)
                ),
                child:  TextField(
                  controller: detailsController.fullName,
                  decoration: InputDecoration(
                    hintText: "Enter Your Full Name",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                  ),
                )),

            const SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Designation",style:TextStyle(
                  fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade400)
                ),
                child:  TextField(
                  controller: detailsController.designation,
                  decoration: InputDecoration(
                      hintText: "Enter Your Designation",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                  ),
                )),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        height: 70,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {



            debugPrint(detailsController.fullName.text);
            debugPrint(detailsController.designation.text);

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
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {}
    });
  }


}