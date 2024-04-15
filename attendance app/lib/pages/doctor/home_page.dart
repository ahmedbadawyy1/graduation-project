import 'package:flutter/material.dart';
import 'package:frist/models/login_response_model.dart';
import 'package:frist/services/api_service.dart';
import 'package:frist/shared_service.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  get loginResponseModel => null;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(4293717228),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26, // Set the desired color for the back arrow
        ),
        centerTitle: true,
        backgroundColor: Color(4291947967),
        title: Text(
          "Menofia University",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),

        ),
      ),
      drawer: Drawer(
      // backgroundColor: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 50),
              children: <Widget>[

                const SizedBox(
                  height: 30,
                ),
                // const Divider(
                //   height: 2,
                // ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/subjects");
                  },
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.subject),
                  title: const Text(
                    "Subjects",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/profile");
                  },
                //  selected: true,
                  selectedColor: Theme.of(context).primaryColor,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.account_circle),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                ListTile(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(

                            title: const Text("Logout"),
                            content: const Text("Are you sure you want to logout?"),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {


                                 Navigator.pushNamed(context, "/");
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          )),


      body: Container(
        // decoration: BoxDecoration(
        //   image:  DecorationImage(
        //     image: AssetImage("images/back.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                color: Color(4292865494).withOpacity(0.5),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {

                    Navigator.pushNamed(context, "/subjects");

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.subject,
                          color: Colors.black,
                          ),
                          title: Text(
                            'Subject',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                          subtitle: Text(
                              'Details of academic subjects and student attendance.',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/subjects");
                              },
                            ),
                            const SizedBox(width: 8),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
