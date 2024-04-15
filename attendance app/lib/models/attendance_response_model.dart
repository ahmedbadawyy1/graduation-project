class AttendanceResponseModel {
  AttendanceResponseModel({
    required this.id,
    required this.name,
    required this.time,
    required this.date,
    required this.weekNumber,
    required this.collegeColiseum,
    required this.subjectId,
  });
  late final int id;
  late final String name;
  late final String time;
  late final String date;
  late final int weekNumber;
  late final String collegeColiseum;
  late final int subjectId;

  AttendanceResponseModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    time = json['time'];
    date = json['date'];
    weekNumber = json['week_number'];
    collegeColiseum = json['college_coliseum'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['time'] = time;
    _data['date'] = date;
    _data['week_number'] = weekNumber;
    _data['college_coliseum'] = collegeColiseum;
    _data['subject_id'] = subjectId;
    return _data;
  }
}