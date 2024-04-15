import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        // Add your app's theme here
      ),
      home: Scaffold(
        backgroundColor: Color(4291947967),
          body: Container(

           // decoration: BoxDecoration(
            //   image:  DecorationImage(
            //     image: AssetImage("images/back.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container(
                     height: 450,
                     width: 250,
                     child: Image.asset("images/photo_2023-06-30_15-29-22-removebg-preview.png"),
                   ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      " Smart Student Attendance System",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " Smart Student Attendance System",
                      style: TextStyle(
                     //   fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: 250,  // Set width
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              backgroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: (){
                            Navigator.pushNamed(context, "/login");
                          },

                          child:Text(
                              "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                              ),),
                    )
                  ],
                ),
              ) ,
            ),
          ),
      ),
    );
  }
}
