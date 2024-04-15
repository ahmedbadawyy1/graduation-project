class AddLectureScheduleRequestModel {
  AddLectureScheduleRequestModel({
    required this.scheduleId,
    required this.doctorId,
    required this.dateTime,
    required this.subjectId,
    required this.collegeColiseum,
  });
  late final String scheduleId;
  late final String doctorId;
  late final String dateTime;
  late final String subjectId;
  late final String collegeColiseum;

  AddLectureScheduleRequestModel.fromJson(Map<String, dynamic> json){
    scheduleId = json['schedule_id'];
    doctorId = json['doctor_id'];
    dateTime = json['date_time'];
    subjectId = json['subject_id'];
    collegeColiseum = json['college_coliseum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['schedule_id'] = scheduleId;
    _data['doctor_id'] = doctorId;
    _data['date_time'] = dateTime;
    _data['subject_id'] = subjectId;
    _data['college_coliseum'] = collegeColiseum;
    return _data;
  }
}