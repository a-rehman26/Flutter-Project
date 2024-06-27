import 'package:flutter/material.dart';
import 'package:tts09b/List%20and%20Grid%20UI/grid_screen.dart';
import 'package:tts09b/List%20and%20Grid%20UI/list_screen.dart';


class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {

  int currentIndex = 0;

  void pageShifter(index){
    setState(() {
      currentIndex = index;
    });
  }

  List myScreens = <Widget>[
    ListViewScreen(),
    GridScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: myScreens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: pageShifter,

          items: const [

        BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),

        BottomNavigationBarItem(icon: Icon(Icons.grid_4x4), label: "Grid"),


      ]),
    );
  }
}
