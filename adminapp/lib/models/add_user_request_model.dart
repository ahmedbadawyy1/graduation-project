class AddUserRequestModel {
  AddUserRequestModel({
    required this.email,
    required this.password,
    required this.name,
  });
  late final String email;
  late final String password;
  late final String name;

  AddUserRequestModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    return _data;
  }
}