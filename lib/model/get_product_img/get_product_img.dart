import 'payload.dart';

class GetProductImg {
  String? msg;
  List<ImgPayload>? payload;

  GetProductImg({this.msg, this.payload});

  @override
  String toString() => 'GetProductImg(msg: $msg, payload: $payload)';

  factory GetProductImg.fromJson(Map<String, dynamic> json) => GetProductImg(
        msg: json['msg'] as String?,
        payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => ImgPayload.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'payload': payload?.map((e) => e.toJson()).toList(),
      };
}
