
// import 'dart:convert';
// import 'package:frist/config.dart';
// import 'package:frist/models/login_request_model.dart';
// import 'package:frist/models/login_response_model.dart';
// import 'package:frist/models/register_request_model.dart';
// import 'package:frist/models/register_response_model.dart';
// import 'package:frist/models/subjects_request_model.dart';
// import 'package:frist/shared_service.dart';
// import 'package:http/http.dart' as http;
// import '../models/subjects_response_model.dart';
//
// class APIService {
//   static APIService instance = APIService();
//   static var client = http.Client();
//
//   static Future<bool> login(LoginRequestModel model) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };
//
//     var url = Uri.parse("http://192.168.1.10:3000/api/login");
//
//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );
//
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final token = jsonData['data']['token'];
//
//       // Save token to shared preferences
//       await SharedService.setToken(token);
//
//       print("Login successful");
//       return true;
//     } else {
//       print("Login failed");
//       return false;
//     }
//   }
//
//   static Future<RegisterResponseModel> register(RegisterRequestModel model) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };
//
//     var url = Uri.http(Config.apiURL, Config.registerAPI);
//
//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );
//     return registerResponseModel(response.body);
//   }
//
//   static Future<List<SubjectResponseModel>> getSubjects(String userId) async {
//     final token = await SharedService.getToken();
//
//     final response = await http.get(
//       Uri.parse('http://192.168.1.10:3000/api/subjects?user_id=$userId'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $token',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       Iterable l = json.decode(response.body);
//       return List<SubjectResponseModel>.from(l.map((model) => SubjectResponseModel.fromJson(model)));
//     } else {
//       throw Exception('Failed to get subjects');
//     }
//   }
// }
// import 'dart:convert';
// import 'package:frist/config.dart';
// import 'package:frist/models/login_request_model.dart';
// import 'package:frist/models/login_response_model.dart';
// import 'package:frist/models/login_response_model.dart';
// import 'package:frist/models/register_request_model.dart';
// import 'package:frist/models/register_response_model.dart';
// import 'package:frist/models/register_response_model.dart';
// import 'package:frist/models/subjects_request_model.dart';
// import 'package:frist/shared_service.dart';
// import 'package:http/http.dart' as http;
// import '../models/login_response_model.dart';
// import '../models/login_response_model.dart';
// import '../models/subjects_response_model.dart';
//
// class APIService {
//   static APIService instance= APIService();
//   static var client = http.Client();
//
//   static Future<bool> login(LoginRequestModel model) async{
//     Map<String, String> requestHeaders = {
//       'Content-Type' : 'application/json',
//     };
//     // http(Config.apiURL, Config.loginAPI)
//     var url = Uri.parse("http://192.168.1.10:3000/api/login");
//
//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//
//     );
//     if(response.statusCode == 200){
//       // Shared   بنجيب الفانكشن
//       await SharedService.setLoginDetails(loginResponseJson(response.body));
//
//       print("goo");
//       return true;
//
//     }else{
//       print("invall");
//       return false ;
//
//     }
//
//   }
//
//   static Future<RegisterResponseModel> register(RegisterRequestModel model) async{
//     Map<String, String> requestHeaders = {
//       'Content-Type' : 'application/json',
//     };
//
//     var url = Uri.http(Config.apiURL, Config.registerAPI); // link api
//
//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//
//     );
//     return registerResponseModel(response.body);
//
//   }
//   static Future<List<SubjectResponseModel>> getSubjects(String token, String userId) async {
//     final response = await http.get(
//       Uri.parse('http://192.168.1.10:3000/api/subjects?user_id=$userId'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $token',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       Iterable l = json.decode(response.body);
//       return List<SubjectResponseModel>.from(l.map((model) => SubjectResponseModel.fromJson(model)));
//     } else {
//       print("dkkdk");
//       throw Exception('Failed to get subjects');
//     }
//   }
//
//
// }


//
// static Future<List<WeeksResponseModel>> getWeeksForSubject(SubjectResponseModel subject) async {
//   final url = 'http://192.168.1.10:3000/weeks/${subject.id}';
//   print(url);
//   final response = await http.get(Uri.parse(url));
//
//   List<WeeksResponseModel> weeksList = [];
//
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     final weeksListJson = jsonResponse['data'] as List<dynamic>;
//
//     weeksList = weeksListJson
//         .map((weekJson) => WeeksResponseModel.fromJson(weekJson))
//         .toList();
//
//     return weeksList;
//   } else {
//     throw Exception('Failed to load weeks for subject: ${response.statusCode}');
//   }
// }



// static Future<List<int>> getWeeksForSubject(int id) async {
//   Map<String, String> requestHeaders = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer ${await SharedService.getToken()}',
//   };
//   var url = Uri.parse("http://192.168.1.10:3000/weeks/$id");
//
//   var response = await client.get(
//     url,
//     headers: requestHeaders,
//   );
//   if (response.statusCode == 200) {
//     List<dynamic> weekList = jsonDecode(response.body);
//     print("ffff");
//     return weekList.cast<int>(); // cast the list of dynamic objects to a list of ints
//   } else {
//     print('Request failed with status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     throw Exception('Failed to get weeks for subject');
//
//   }
// }

import 'dart:convert';
import 'package:excel/excel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frist/config.dart';
import 'package:frist/models/login_request_model.dart';
import 'package:frist/models/login_response_model.dart';
import 'package:frist/models/profile_response_model.dart';
import 'package:frist/models/register_request_model.dart';
import 'package:frist/models/register_response_model.dart';
import 'package:frist/models/weeks_response_model.dart';
import 'package:frist/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/attendance_excel_response_model.dart';
import '../models/attendance_response_model.dart';
import '../models/subjects_response_model.dart';
import 'package:file/local.dart';



String apilink = "192.168.1.3" ;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async{
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.parse("http://${apilink}:3000/api/login");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),

    );
    if(response.statusCode == 200){
      // Shared   بنجيب الفانكشن
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      print("goo");
      return true;

    }else{
      print("invall");
      return false ;

    }

  }

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async{
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI); // link api

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),

    );
    return registerResponseModel(response.body);

  }

  static Future<List<SubjectResponseModel>> getSubjects() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedService.getToken()}', // pass token here
    };
    var url = Uri.parse("http://${apilink}:3000/api/subjects");

    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    List<SubjectResponseModel>SubjectList=[];
    if (response.statusCode == 200) {
      SubjectList= (jsonDecode(response.body) as List)
          .map((object) => SubjectResponseModel.fromJson(object))
          .toList();
      SubjectList.forEach((element) {
        print(element.name);
        print(element.id);
      });
      return SubjectList;
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to get subjects');
    }
  }



  //شغال
  static Future<List<WeeksResponseModel>> getWeeksForSubject(SubjectResponseModel subject,) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedService.getToken()}', // pass token here
    };
    var url = Uri.parse('http://${apilink}:3000/weeks/${subject.id}');
    print(subject.id);
    print(url);


    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    List<WeeksResponseModel>weeksList=[];
    if (response.statusCode == 200) {
      print("jjj");
      weeksList= (jsonDecode(response.body) as List)
          .map((object) => WeeksResponseModel.fromJson(object))
          .toList();
      weeksList.forEach((element) {

      });
      return weeksList;
    } else {
      print("ttt");
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to getweeks');
    }
  }

  static Future<List<AttendanceResponseModel>> getAttendanceForWeek(SubjectResponseModel subject, WeeksResponseModel week) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedService.getToken()}', // pass token here
    };
    var url = Uri.parse('http://${apilink}:3000/api/attendance/subject/${subject.id}/week/${week.weekNumber}');//${subject.id}
    print(subject.id);
    print(week.weekNumber);
    print(url);


    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    List<AttendanceResponseModel>attendanceList=[];
    if (response.statusCode == 200) {
      print("jjj");
      attendanceList= (jsonDecode(response.body) as List)
          .map((object) => AttendanceResponseModel.fromJson(object))
          .toList();
      attendanceList.forEach((element) {

      });
      return attendanceList;
    } else {
      print("ttt");
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to getattendance');
    }
  }
  static Future<void> downloadAttendanceAsExcel(
      SubjectResponseModel subject, WeeksResponseModel week) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedService.getToken()}',
    };

    var url = Uri.parse(
        'http://${apilink}:3000/attendance/${subject.id}/week/${week.weekNumber}');

    final response = await http.get(url, headers: requestHeaders);
    if (response.statusCode != 200) {
      // handle error
      print(response.body);
      return;
    }

    final jsonData = jsonDecode(response.body);
    print(response.body);

    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    // Add column headers
    sheet.cell(CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: 0)).value = 'StudentID';
    sheet.cell(CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: 1)).value = 'Name';
    sheet.cell(CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: 2)).value = 'SubjectID';
    sheet.cell(CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: 3)).value = 'WeekNumber';
    sheet.cell(CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: 4)).value = 'Date';
    sheet.cell(CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: 5)).value = 'Time';

    // Add data rows
    int rowIndex = 1;
    for (var data in jsonData) {
      final attendance = AttendancExcelResponseModel.fromJson(data);

      sheet.cell(CellIndex.indexByColumnRow(rowIndex: rowIndex, columnIndex: 0))
          .value = attendance.StudentID;
      sheet.cell(CellIndex.indexByColumnRow(rowIndex: rowIndex, columnIndex: 1))
          .value = attendance.Name;
      sheet.cell(CellIndex.indexByColumnRow(rowIndex: rowIndex, columnIndex: 2))
          .value = attendance.SubjectID;
      sheet.cell(CellIndex.indexByColumnRow(rowIndex: rowIndex, columnIndex: 3))
          .value = attendance.WeekNumber;
      sheet.cell(CellIndex.indexByColumnRow(rowIndex: rowIndex, columnIndex: 4))
          .value = attendance.Date;
      sheet.cell(CellIndex.indexByColumnRow(rowIndex: rowIndex, columnIndex: 5))
          .value = attendance.Time;

      rowIndex++;
    }

    final appDocDir = await getExternalStorageDirectory();
    final file = LocalFileSystem().file(
        '${appDocDir!.path}/attendance${subject.id}week${week.weekNumber}.csv');

         final List<int>? encodedExcel = excel.encode();
     if (encodedExcel != null) {
     await file.writeAsBytes(encodedExcel);
    Fluttertoast.showToast(msg: 'Attendance saved to ${file.path}');
    print("${file.path}");
  }
}
  static Future<ProfileResponseModel> getUserProfile(LoginResponseModel Data,) async {

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedService.getToken()}',
    };
    var url = Uri.parse("http://${apilink}:3000/profile/${Data.data.id}");

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      print("ggg");
      var jsonResponse = jsonDecode(response.body);
      return ProfileResponseModel.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to get user profile');
    }
  }

}



