

//wprk
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frist/pages/doctor/addnewsubjects.dart';
import 'package:frist/pages/doctor/attendance_week.dart';
import 'package:frist/pages/doctor/home_page.dart';
import 'package:frist/pages/doctor/login_page.dart';
import 'package:frist/pages/doctor/main_view.dart';
import 'package:frist/pages/doctor/profile_page.dart';
import 'package:frist/pages/doctor/register_page.dart';
import 'package:frist/pages/doctor/search_results_screen.dart';
import 'package:frist/pages/doctor/slpash_page.dart';
import 'package:frist/pages/doctor/subjects.dart';
import 'package:frist/pages/doctor/week_option.dart';
import 'package:frist/pages/doctor/weeks_page.dart';




void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Fluttertoast.showToast(msg: "App Started!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
    routes: {
        '/': (context) => const Splash(),
      '/login': (context) => const LoginPage(),
        '/MainView': (context) => const MainView(),
      '/home': (context) => const Home(),
        '/register': (context) => const RegisterPage(),
      '/profile': (context) => const Profile(),
      '/weekoption': (context) => const WeekOption(),
        '/subjects': (context) => const Subjects(),
      '/weeks': (context) => const Weeks(),//subject: SubjectResponseModel.subject
      '/attendaceweek': (context) => const AttendanceWeek(),
      '/addnewsubject': (context) => const AddNewSubject(),
      '/searchresultsscreen': (context) => const SearchResultsScreen(searchResults: [],),

      },
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:frist/pages/doctor/addnewsubjects.dart';
// import 'package:frist/pages/doctor/attendance_week.dart';
// import 'package:frist/pages/doctor/home_page.dart';
// import 'package:frist/pages/doctor/login_page.dart';
// import 'package:frist/pages/doctor/register_page.dart';
// import 'package:frist/pages/doctor/subjects.dart';
// import 'package:frist/pages/doctor/weeks_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? lastRoute = prefs.getString('lastRoute');
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//
//   runApp(MyApp(
//     initialRoute: isLoggedIn ? lastRoute ?? '/home' : '/login',
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   final String initialRoute;
//
//   const MyApp({Key? key, required this.initialRoute}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: initialRoute,
//       routes: {
//         '/login': (context) => const LoginPage(),
//         '/home': (context) => const Home(),
//         '/register': (context) => const RegisterPage(),
//         '/subjects': (context) => const Subjects(),
//         '/weeks': (context) => const Weeks(),
//         '/attendanceweek': (context) => const AttendanceWeek(),
//         '/addnewsubject': (context) => const AddNewSubject(),
//       },
//       onGenerateRoute: (settings) {
//         // Save the last route visited to shared preferences
//         SharedPreferences.getInstance().then((prefs) {
//           prefs.setString('lastRoute', settings.name ?? '/home');
//         });
//         return null;
//       },
//     );
//   }
// }
