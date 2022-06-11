import 'payload.dart';

class FruitProducts {
  String? msg;
  List<FruitPayload>? payload;

  FruitProducts({this.msg, this.payload});

  factory FruitProducts.fromJson(Map<String, dynamic> json) => FruitProducts(
        msg: json['msg'] as String?,
        payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => FruitPayload.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'payload': payload?.map((e) => e.toJson()).toList(),
      };
}
