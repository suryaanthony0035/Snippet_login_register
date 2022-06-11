class FruitPayload {
  String? id;
  String? productId;
  String? name;
  String? description;
  int? price;
  String? cloudinaryid;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  FruitPayload({
    this.id,
    this.productId,
    this.name,
    this.description,
    this.price,
    this.cloudinaryid,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory FruitPayload.fromJson(Map<String, dynamic> json) => FruitPayload(
        id: json['_id'] as String?,
        productId: json['productId'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        cloudinaryid: json['cloudinaryid'] as String?,
        img: json['img'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'productId': productId,
        'name': name,
        'description': description,
        'price': price,
        'cloudinaryid': cloudinaryid,
        'img': img,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
