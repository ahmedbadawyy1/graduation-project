// class AttendancExcelResponseModel {
//   AttendancExcelResponseModel({
//     required this.studentId,
//
//     required this.Name,
//     required this.SubjectID,
//     required this.WeekNumber,
//     required this.Date,
//   });
//  late final int studentId;
//   late final String Name;
//   late final int SubjectID;
//   late final int WeekNumber;
//   late final String Date;
//
//   AttendancExcelResponseModel.fromJson(Map<String, dynamic> json){
//     studentId =json['studentId'];
//     Name = json['Name'];
//     SubjectID = json['Subject ID'];
//     WeekNumber = json['Week Number'];
//     Date = json['Date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data["studentId"] = studentId;
//     _data['Name'] = Name;
//     _data['SubjectID'] = SubjectID;
//     _data['WeekNumber'] = WeekNumber;
//     _data['Date'] = Date;
//     return _data;
//   }
// }
//

//
// class AttendancExcelResponseModel {
//   late final int studentId;
//   late final String name;
//   late final int subjectId;
//   late final int weekNumber;
//   late final String date;
//
//   AttendancExcelResponseModel({
//     required this.studentId,
//     required this.name,
//     required this.subjectId,
//     required this.weekNumber,
//     required this.date,
//   });
//
//   factory AttendancExcelResponseModel.fromJson(Map<String, dynamic> json) {
//     return AttendancExcelResponseModel(
//       studentId: json['Student ID'],
//       name: json['Name'],
//       subjectId: json['Subject ID'],
//       weekNumber: json['Week Number'],
//       date: json['Date'],
//     );
//   }
// }

// class AttendancExcelResponseModel {
//   late final int studentId;
//   late final String name;
//   late final int subjectId;
//   late final int weekNumber;
//   late final String date;
//
//   AttendancExcelResponseModel({
//     required this.studentId,
//     required this.name,
//     required this.subjectId,
//     required this.weekNumber,
//     required this.date,
//   });
//
//   factory AttendancExcelResponseModel.fromJson(Map<String, dynamic> json) {
//     return AttendancExcelResponseModel(
//       studentId: json['studentId'],
//       name: json['Name'],
//       subjectId: json['Subject ID'],
//       weekNumber: json['Week Number'],
//       date: json['Date'],
//     );
//   }
// }

class AttendancExcelResponseModel {
  AttendancExcelResponseModel({
    required this.StudentID,
    required this.Name,
    required this.SubjectID,
    required this.WeekNumber,
    required this.Date,
    required this.Time,
  });
  late final int StudentID;
  late final String Name;
  late final int SubjectID;
  late final int WeekNumber;
  late final String Date;
  late final String Time;

  AttendancExcelResponseModel.fromJson(Map<String, dynamic> json){
    StudentID = json['Student_ID'];
    Name = json['Name'];
    SubjectID = json['Subject_ID'];
    WeekNumber = json['Week_Number'];
    Date = json['Date'];
    Time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Student_ID'] = StudentID;
    _data['Name'] = Name;
    _data['Subject_ID'] = SubjectID;
    _data['Week_Number'] = WeekNumber;
    _data['Date'] = Date;
    _data['Time'] = Time;
    return _data;
  }
}