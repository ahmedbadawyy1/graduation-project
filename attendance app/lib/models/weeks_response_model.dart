class WeeksResponseModel {
 static WeeksResponseModel week = WeeksResponseModel(weekNumber: 1);
  WeeksResponseModel({
    required this.weekNumber,
  });
  late final int weekNumber;

  WeeksResponseModel.fromJson(Map<String, dynamic> json){
    weekNumber = json['week_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['week_number'] = weekNumber;
    return _data;
  }
}



