// class ProfileResponseModel {
//   static ProfileResponseModel profile = ProfileResponseModel(email:"", name:"");
//   ProfileResponseModel({
//
//     String? name;
//     required this.email,
//     required this.name,
//   });
//   late final String email;
//   late final String name;
//
//   ProfileResponseModel.fromJson(Map<String, dynamic> json){
//     email = json['email'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['email'] = email;
//     _data['name'] = name;
//     return _data;
//   }
// }
//

class ProfileResponseModel {
  static ProfileResponseModel Profile = ProfileResponseModel(
      email: "ffd@gmail.com", name: "ghhg");
  String? email;
  String? name;

  ProfileResponseModel({required this.email, required this.name});

  // from json
  ProfileResponseModel.fromJson(Map<String, dynamic>json){
    email = json["email"];
    name = json["name"];
  }

  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "name": name,

    };
  }
}













