
import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
     LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  static LoginResponseModel login = LoginResponseModel(message:"", data: Data.data );
  LoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  static Data data = Data(email: "", id: 1, token: "");
  Data({
    required this.email,
    required this.id,
    required this.token,
  });
  late final String email;
  late final int id;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }

}




// import 'dart:convert';
//
// LoginResponseModel loginResponseJson(String str) =>
//      LoginResponseModel.fromJson(json.decode(str));
// class LoginResponseModel {
//   LoginResponseModel({
//     required this.token,
//   });
//   late final String token;
//
//   LoginResponseModel.fromJson(Map<String, dynamic> json){
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['token'] = token;
//     return _data;
//   }
// }








// import 'dart:convert';
//
// LoginResponseModel loginResponseJson(String str) =>
//      LoginResponseModel.fromJson(json.decode(str));
// class LoginResponseModel {
// LoginResponseModel.dart({
// required this.message,
// required this.data,
// });
// late final String message;
// late final Data data;
//
// LoginResponseModel.fromJson(Map<String, dynamic> json){
// message = json['message'];
// data = Data.fromJson(json['data']);
// }
//
// Map<String, dynamic> toJson() {
// final _data = <String, dynamic>{};
// _data['message'] = message;
// _data['data'] = data.toJson();
// return _data;
// }
// }
//
// class Data {
// Data({
// required this.username,
// required this.email,
// required this.date,
// required this.id,
// required this.token,
// });
// late final String username;
// late final String email;
// late final String date;
// late final String id;
// late final String token;
//
// Data.fromJson(Map<String, dynamic> json){
// username = json['username'];
// email = json['email'];
// date = json['date'];
// id = json['id'];
// token = json['token'];
// }
//
// Map<String, dynamic> toJson() {
// final _data = <String, dynamic>{};
// _data['username'] = username;
// _data['email'] = email;
// _data['date'] = date;
// _data['id'] = id;
// _data['token'] = token;
// return _data;
// }
// }