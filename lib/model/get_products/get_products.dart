import 'payload.dart';

class GetProducts {
  String? msg;
  List<ProductPayload>? payload;

  GetProducts({this.msg, this.payload});

  @override
  String toString() => 'GetProducts(msg: $msg, payload: $payload)';

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
        msg: json['msg'] as String?,
        payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => ProductPayload.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'payload': payload?.map((e) => e.toJson()).toList(),
      };
}
