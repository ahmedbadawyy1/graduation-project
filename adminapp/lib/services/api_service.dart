




import 'package:adminapp/services/shared_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';




String apilink = "172.20.10.10" ;


class APIService {
  static var client = http.Client();
  static Future<bool> login(LoginRequestModel model, BuildContext context,) async{
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.parse("http://${apilink}:3000/api/admin/login");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),

    );
    if(response.statusCode == 200){
      // Shared   بنجيب الفانكشن
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/HomeAdmin',
            (route) => false,
      );
      return true;

    }else{
      print("invall");
      return false ;

    }

  }



}