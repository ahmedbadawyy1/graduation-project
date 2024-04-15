import 'package:flutter/material.dart';
import 'package:frist/pages/doctor/profile_page.dart';
import 'package:frist/pages/doctor/subjects.dart';
import 'package:frist/pages/doctor/weeks_page.dart';
import 'attendance_week.dart';
import 'home_page.dart';



class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  int index = 0 ;
  final screens = [
    Home(),
    Profile(),
    Subjects(),
 //   Subjects(),
    AttendanceWeek(),
    Weeks(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color(4293717228),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Color(4291947967),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          //  animationDuration: Duration(seconds:1),
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index =index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home),
              label: "Home" ,
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              //  selectedIcon: Icon(Icons.person),
              label: "Profile" ,
            ),
          ],
        ),
      ),
    );

  }
}

