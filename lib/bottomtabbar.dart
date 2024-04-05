import 'package:flutter/material.dart';
import 'package:pix_resume/hometab.dart';
import 'package:pix_resume/setting_tab/settingtab.dart';
import 'package:pix_resume/templatestab.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedtab=0;

  List<dynamic> pages=[const HomePage(),const TemplatesPage(isFromHome:false),const SettingPage()];

  changeTab(int index){
    setState(() {
      selectedtab=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedtab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedtab,
          onTap: (index) => changeTab(index),
          selectedItemColor: const Color(0xff0D74FF) ,
          unselectedItemColor: Colors.grey,

          items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.space_dashboard_rounded),
          label: "Templates",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_rounded),
          label: "Settings",
        ),
      ]),
    );
  }
}
