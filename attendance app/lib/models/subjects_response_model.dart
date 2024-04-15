//شغال
class SubjectResponseModel {
 static SubjectResponseModel subject = SubjectResponseModel(id:1, name: "some name");
    int? id;
    String? name;
  SubjectResponseModel({required this.id,required this.name});


  // from json
SubjectResponseModel.fromJson(Map<String,dynamic>json){

id =json["id"];
name =json["name"];

}

Map<String,dynamic>tojson(){

  return{
    "id":id,
    "name":name,

  };

}





  }






//
// class SubjectResponseModel {
//   SubjectResponseModel({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
//
//   SubjectResponseModel.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }
//
//
//



// class SubjectResponseModel {
//  static SubjectResponseModel selectedSubject = SubjectResponseModel(
//     id: 123, // replace with the ID of the selected subject
//     name: "Selected Subject", // replace with the name of the selected subject
//   );
//
//   int? id;
//   String? name;
//
//   SubjectResponseModel({this.id, this.name});
//
//   // from json
//   SubjectResponseModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//     };
//   }
//
//   String getIdAsString() {
//     return id.toString();
//   }
// }