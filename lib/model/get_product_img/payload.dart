class ImgPayload {
  bool? isPopular;
  String? idm;
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  int? typeId;
  String? createdAt;
  String? updatedAt;
  int? v;

  ImgPayload({
    this.isPopular,
    this.idm,
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  String toString() {
    return 'Payload(isPopular: $isPopular, id: $id, id: $id, name: $name, description: $description, price: $price, stars: $stars, img: $img, location: $location, typeId: $typeId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  factory ImgPayload.fromJson(Map<String, dynamic> json) => ImgPayload(
        isPopular: json['is_popular'] as bool?,
        idm: json['_id'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        stars: json['stars'] as int?,
        img: json['img'] as String?,
        location: json['location'] as String?,
        typeId: json['type_id'] as int?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'is_popular': isPopular,
        '_id': id,
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'stars': stars,
        'img': img,
        'location': location,
        'type_id': typeId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
