import 'package:flutter/material.dart';

import '../services/shared_service.dart';



class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26, // Set the desired color for the back arrow
        ),
        title: Text(
          "Home Admin",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(4291947967),
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
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/AddUser',
                    );
                  },
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.add),
                  title: const Text(
                    "Add user",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/AddLecture',
                    );
                  },
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.add_task_rounded),
                  title: const Text(
                    "Add lecture",
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
                              onPressed: () async {
                                await SharedService.logout(context);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                      (route) => false,
                                );
                              },
                              icon: const Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),

              ],
            ),
          )),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Column(
            children: [
              Card(
              color: Color(4292865494).withOpacity(0.5),
           clipBehavior: Clip.hardEdge,
           child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/AddUser',
              );
             },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.black,),
                    title: Text(
                      'Add user',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'Add New Doctor',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
                                borderRadius:
                                BorderRadius.circular(30
                                ))),
                        child: const Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/AddUser',
                          );
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
              Card(
                color: Color(4292865494).withOpacity(0.5),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                    context,
                    '/AddLecture',
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.add_task_rounded,
                            color: Colors.black,),
                          title: Text(
                            'Add Lecture Schedule ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            'Add Data For New Lecture',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
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
                                      borderRadius:
                                      BorderRadius.circular(30
                                      ))),
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/AddLecture',
                                );
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
            ],
          ),
        ),
      ) ,


    );
  }
}
