import 'package:flutter/material.dart';
import 'package:frist/models/login_response_model.dart';
import '../../models/profile_response_model.dart';
import '../../services/api_service.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      ProfileResponseModel profile = await APIService.getUserProfile(LoginResponseModel.login);
      setState(() {
        username = profile.name;
        email = profile.email;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

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
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("images/back.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
         //     crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                   "Username :  ${username}",//'${ProfileResponseModel.Profile.name}
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Email :  ${email}" ,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


