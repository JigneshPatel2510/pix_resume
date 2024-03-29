import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/items/certificate_items.dart';

class Certificates extends StatefulWidget {
  const Certificates({super.key});

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
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
        title: const Text("Certificates",
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
                child: Text("Name Of Certificate",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.nameOfCertificate,
                    decoration: InputDecoration(
                        hintText: "Enter Certificate Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Academy Name",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.academyName,
                    decoration: InputDecoration(
                        hintText: "Enter Academy Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Academy Address",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.academyAddress,
                    decoration: InputDecoration(
                        hintText: "Enter Academy Address",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                    ),
                  )),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Certificate Year",style:TextStyle(
                    fontWeight: FontWeight.w600, letterSpacing: .5, fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child:  TextField(
                    controller: detailsController.certificateYear,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Your Certificate Year",
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
                      detailsController.addCertificate();
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
                itemCount: detailsController.certificate.length,
                itemBuilder: (context, index) {
                return CertificateItems(index: index,data: detailsController.certificate[index],);
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
            debugPrint(detailsController.nameOfCertificate.text);
            debugPrint(detailsController.academyName.text);
            debugPrint(detailsController.academyAddress.text);
            debugPrint(detailsController.certificateYear.text);
            

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
