import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/Controllers/details_controller.dart';

class SkillsName extends StatefulWidget {
  const SkillsName({super.key});

  @override
  State<SkillsName> createState() => _SkillsNameState();
}

class _SkillsNameState extends State<SkillsName> {
  DetailsController detailsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailsController.selectedSkillList.clear();
    detailsController.getSkill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Skills",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontWeight: FontWeight.w900)),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, height: 2.5),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    hintText: "Search Skill Name"),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: detailsController.skillList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(detailsController.skillList[index]['name']),
                        trailing: Checkbox(

                          activeColor: const Color(0xff0D74FF),
                          value: detailsController.skillList[index]['isChecked']??false,
                          onChanged: (value) {
                            if(value==true){
                              if(detailsController.selectedSkillList.length<5){
                                detailsController.skillList[index]['isChecked']=value;
                                detailsController.selectedSkillList.add(detailsController.skillList[index]);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Required maximum 5 skills")));
                              }
                            }else{
                              detailsController.selectedSkillList.remove(detailsController.skillList[index]);
                              detailsController.skillList[index]['isChecked']=value;
                            }




                            setState(() {

                            });
                          },
                        ),
                      );
                    },
                  )),
            )
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
            List selectedList=[];
            for(int i=0;i<detailsController.selectedSkillList.length;i++){
              selectedList.add(detailsController.selectedSkillList[i]["name"]);
            }

            Get.back(result: selectedList.join(" , "));
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
                    child: Text("Add",
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
