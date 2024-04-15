import 'package:adminapp/screens/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '../models/login_request_model.dart';
import '../services/api_service.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess =false;
  bool hidePassword =true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(4293717228),
          body: Container(
            child: ProgressHUD(
              child: Form(
                key:  globalFormKey,
                child: Center(child: _loginUI(context)) ,
              ),
              inAsyncCall: isAPIcallProcess,
              opacity: .3,
              key: UniqueKey() ,

            ),
          ),
        ));
  }

  Widget _loginUI(BuildContext context) {


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 25,
                  left: 25 ,
                  bottom:50,
                ),

                child: Container(
                  height: 450,
                  width: 250,
                  child: Image.asset("images/photo_2023-07-06_13-42-10-removebg-preview.png"),
                ),),
              SizedBox(height: 5,),
              Text("Admin",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 30,),
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
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,

                      ),
                      children: <TextSpan> [
                        TextSpan(
                          text: "Forget Password ?",
                          style: TextStyle(
                            fontWeight:FontWeight.w500 ,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("foooo");
                            },
                        ),
                      ],
                    ),
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.black,// Color(4294901760)
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white70, fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if ( validateAndSave()){
                        setState(() {
                          isAPIcallProcess= true;
                        });
                        LoginRequestModel model = LoginRequestModel(
                            email: email!, password: password!);
                        APIService.login(model, context).then((response) => {
                          setState(() {
                            isAPIcallProcess= false;
                          }),
                          if(response){
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                "/HomeAdmin",
                                    (route) => false)
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0x9870694B),
                              content:const Text(
                                'Invalid Username or passaword',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ) ,
                              action: SnackBarAction(
                                label: 'ok',
                                textColor: Colors.black,
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ),),
                          }
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
                        ],
          ),
        ),
      ),
    );

  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

}
