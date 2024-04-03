import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';
import 'package:pix_resume/add_details.dart';
import 'package:pix_resume/go_premium.dart';

class TemplatesPage extends StatefulWidget {
  const TemplatesPage({super.key});

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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
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
        child: SingleChildScrollView(
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
              SizedBox(
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
                                  Get.to(AddDetails());

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
      ),
    );
  }
}
