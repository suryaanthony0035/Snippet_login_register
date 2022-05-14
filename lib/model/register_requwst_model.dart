class RegisterRequestModel {
  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    required this.conformPassword,
    // required this.role,
  });
  late final String username;
  late final String email;
  late final String password;
  late final String conformPassword;
  // late final String role;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    conformPassword = json['conformPassword'];
    // role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['conformPassword'] = conformPassword;
    // _data['role'] = role;
    return _data;
  }
}
