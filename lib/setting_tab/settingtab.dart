import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pix_resume/go_premium.dart';
import 'package:pix_resume/setting_tab/my_account.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Setting",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: .5)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Profile",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w900),),
              ),
              ListTile(
                onTap: () {
                  Get.to(const MyAccount());
                },
                leading: Image.asset("assets/icons/ic_user.png",height: 23,color:const Color(0xff0D74FF) ),
                minLeadingWidth: 15,
                title: Row(
                  children: [
                    const Text("My Account",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900)),
                    const Spacer(),
                    Flexible(child: Text("jigspatel1623@gmail.com",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10,color: Colors.grey.shade400),))
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade400,size: 14,),
              ),
              ListTile(
                onTap: () {
                  Get.to(const GoPremium());
                },
                leading: Image.asset("assets/icons/ic_go_premium.png",color: const Color(0xff0D74FF),height: 25),
                minLeadingWidth: 15,
                title: Row(
                  children: [
                    const Text("Go Premium",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900)),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                        child: Text("Free",style: TextStyle(color: Colors.white,fontSize: 10),),
                      ),
                    )
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade400,size: 14,),
                
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(height: 1,color:Colors.grey.shade300,),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Term and Privacy",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w900),),
              ),
              ListTile(
                leading: Image.asset("assets/icons/ic_terms.png",height: 25,color:const Color(0xff0D74FF) ),
                minLeadingWidth: 15,
                title: const Text("Term of Use",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900)),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade400,size: 14,),
              ),
              ListTile(
                leading:  Image.asset("assets/icons/ic_terms.png",height: 25,color:const Color(0xff0D74FF) ),
                minLeadingWidth: 15,
                title: const Text("Terms of Privacy",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900)),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade400,size: 14,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(height: 1,color:Colors.grey.shade300,),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Contact",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w900),),
              ),
              ListTile(
                leading: Image.asset("assets/icons/ic_star.png",height: 23,color:const Color(0xff0D74FF) ),
                minLeadingWidth: 15,
                title: const Text("Rate Our App",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900)),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade400,size: 14,),
              ),
              ListTile(
                leading: Image.asset("assets/icons/ic_language.png",height: 23,color:const Color(0xff0D74FF) ),
                minLeadingWidth: 15,
                title: const Text("Our Website",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900)),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade400,size: 14,),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("App Version 0.01",style: TextStyle(color: Colors.grey.shade400,fontSize: 11,fontWeight: FontWeight.w900),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
