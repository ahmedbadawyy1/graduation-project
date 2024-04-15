//
//
// import 'dart:convert';
//
// import 'package:api_cache_manager/api_cache_manager.dart';
// import 'package:api_cache_manager/models/cache_db_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:frist/models/login_response_model.dart';
//
// class SharedService {
//
//   static Future<bool> isLoggedIn() async {
//     var isKeyExist=
//         await APICacheManager().isAPICacheKeyExist("login_details");
//
//     return isKeyExist;
//
//   }
//   static Future<LoginResponseModel?> loginDetails() async {
//
//     var isKeyExist=
//     await APICacheManager().isAPICacheKeyExist("login_details");
//
//
//     if (isKeyExist) {
//       var cacheDate =await APICacheManager().getCacheData("login_details");
//       return loginResponseJson(cacheDate.syncData);
//     }
//
//   }
//
//   static Future<void> setLoginDetails(
//       LoginResponseModel model ,
//       ) async {
//       APICacheDBModel cacheDBModel = APICacheDBModel(
//           key: "login_details",
//           syncData: jsonEncode(model.toJson()),
//       );
//       await APICacheManager().addCacheData(cacheDBModel);
//   }
//
//   static Future<void> logout(BuildContext context) async {
//     await APICacheManager().deleteCache( "login_details");
//     Navigator.pushNamedAndRemoveUntil(
//         context,
//         "/login",
//             (route) => false,
//     );
//
//   }
//
//
// }

import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:frist/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");

    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");
      var jsonData = jsonDecode(cacheData.syncData);
      var jsonString = jsonEncode(jsonData); // convert Map to JSON string
      return loginResponseJson(jsonString);
    }
  }


  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(model.toJson()),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
          (route) => false,
    );
  }

  static Future<String?> getToken() async {
    LoginResponseModel? cachedLoginDetails = await loginDetails();
    if (cachedLoginDetails != null) {
      return cachedLoginDetails.data.token;
    } else {
      return null;
    }
  }

}
