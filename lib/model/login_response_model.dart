import 'dart:convert';

LoginResponceModel loginResponceJson(String str) =>
    LoginResponceModel.fromJson(json.decode(str));

class LoginResponceModel {
  LoginResponceModel.dart({
    required this.msg,
    required this.payload,
  });
  late final String msg;
  late final Payload payload;

  LoginResponceModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class Payload {
  Payload({
    required this.AcessToken,
    required this.ID,
  });
  late final String AcessToken;
  late final String ID;

  Payload.fromJson(Map<String, dynamic> json) {
    AcessToken = json['AcessToken'];
    ID = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['AcessToken'] = AcessToken;
    _data['ID'] = ID;
    return _data;
  }
}
