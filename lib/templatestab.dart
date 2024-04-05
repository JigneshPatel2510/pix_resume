import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/go_premium.dart';
import 'package:pix_resume/template_viewer.dart';

class TemplatesPage extends StatefulWidget {
  final bool isFromHome;
  const TemplatesPage({super.key, required this.isFromHome});

  @override
  State<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends State<TemplatesPage> {
  DetailsController detailsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailsController.showTemplates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.isFromHome?IconButton(onPressed: () {
          Get.back();

        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)):const SizedBox.shrink(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: widget.isFromHome?null:0,
        title: const Text("Templates",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: .5)),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Get.to(const GoPremium());
            },
            child: Material(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/icons/ic_premium.png",
                height: 35,
                width: 35,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade100),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Image.asset("assets/icons/ic_search.png",
                                height: 20, width: 20, color: Colors.grey.shade400),
                          ),
                          hintText: "Search Templates...",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Obx(() => GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: detailsController.templatesList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1 / 1.5,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10
                                    ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      detailsController.template=detailsController.templatesList[index]["name"];
                                      // Get.to(AddDetails());
                                      Get.to(TemplateViewer(template: detailsController.templatesList[index],));

                                    },
                                    child: Container(
                                      // margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12),
                                      ),
                                      child: ClipRRect(
                                        child: Image.network(
                                            detailsController.templatesList[index]
                                                ["preview"],
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  );
                                },
                              ))),
                    ],
                  )
                ],
              ),
            ),
            Obx(() => detailsController.isLoading.value?Container(
                // color: Colors.black12,
                // height: Get.height*.75,
                child: Center(child: Lottie.asset("assets/lottiefiles/loader2.json",height: 100))):const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
