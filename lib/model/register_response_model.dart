import 'dart:convert';

RegisterResponceModel registerResponceModel(String str) =>
    RegisterResponceModel.fromJson(json.decode(str));

class RegisterResponceModel {
  RegisterResponceModel.dart({
    required this.msg,
    required this.payload,
  });
  late final String msg;
  late final Payload? payload;

  RegisterResponceModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['payload'] = payload!.toJson();
    return _data;
  }
}

class Payload {
  Payload({
    required this.username,
    required this.email,
  });
  late final String username;
  late final String email;

  Payload.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    return _data;
  }
}
