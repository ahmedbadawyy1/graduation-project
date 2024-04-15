import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adminapp/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/add_user_request_model.dart';
import '../models/add_user_response_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String email = "";
  String password = "";
  String name = "";
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> addUser() async {
    setState(() {
      isAPIcallProcess = true;
    });

    // Create the request body using the AddUserRequestModel
    AddUserRequestModel requestModel =
    AddUserRequestModel(email: email, password: password, name: name);
    Map<String, dynamic> requestBody = requestModel.toJson();

    // Make the API request
    final response = await http.post(
      Uri.parse('http://192.168.1.3:3000/admin/users'),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Successful response
      final responseData = jsonDecode(response.body);
      AddUserResponseModel responseModel =
      AddUserResponseModel.fromJson(responseData);

      // Handle the response as needed
      String message = responseModel.message;

      // Show success message using a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added: $message')),
      );
    } else {
      // Error occurred
      print('Error: ${response.statusCode}');
    }

    setState(() {
      isAPIcallProcess = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26, // Set the desired color for the back arrow
        ),
        title: Text(
          "Add User",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(4291947967),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Icon(
                  Icons.person,
                  size:150 ,
                ),

                SizedBox(
                  height: 25,
                ),

                TextFormField(

                  keyboardType: TextInputType.name,
                  decoration: textInputDecoration.copyWith(
                      fillColor: Color(4292275656).withOpacity(0.5),
                      labelText: "Name",

                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                        //  color: Theme.of(context).primaryColor,
                      )),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  // check tha validation

                ),
                SizedBox(height: 25,),
                TextFormField(
                  obscureText: hidePassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,

                  decoration: textInputDecoration.copyWith(
                      fillColor: Color(4292275656).withOpacity(0.5),
                      labelText: "Password",

                      suffixIcon: IconButton(
                        color: Colors.black,
                        onPressed: (){
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },

                        icon: Icon(
                            hidePassword? Icons.visibility_off :  Icons.visibility
                        ),

                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        //    color: Theme.of(context).primaryColor,
                      )),
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 25,),
                TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration.copyWith(
                      fillColor: Color(4292275656).withOpacity(0.5),
                      labelText: "Email",

                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                        //  color: Theme.of(context).primaryColor,
                      )),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },

                  // check tha validation
                  validator: (val) {
                    return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                ),
                SizedBox(height: 15,),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "Add User",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: isAPIcallProcess ? null : addUser,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
