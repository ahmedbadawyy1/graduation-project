import 'package:adminapp/screens/add_lecture_schedule.dart';
import 'package:adminapp/screens/add_user.dart';
import 'package:adminapp/screens/home_admin.dart';
import 'package:adminapp/screens/login_admin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/HomeAdmin': (context) => const HomeAdmin(),
        '/AddUser': (context) => const AddUser(),
        '/AddLecture': (context) => const AddLecture(),

      },
    );
  }
}

