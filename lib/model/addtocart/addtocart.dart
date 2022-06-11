class Cart {
  String? id;
  String? productId;
  String? name;
  String? description;
  String? price;
  String? unitTag;
  String? quantity;
  String? cloudinaryid;
  String? img;

  Cart({
    this.id,
    this.productId,
    this.name,
    this.description,
    this.price,
    this.cloudinaryid,
    this.quantity,
    this.unitTag,
    this.img,
  });

  Cart.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        name = res['name'],
        description = res['description'],
        price = res['price'],
        quantity = res['quantity'],
        unitTag = res['unitTag'],
        cloudinaryid = res['cloudinaryid'],
        img = res['img'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'unitTag': unitTag,
      'cloudinaryid': cloudinaryid,
      'img': img,
    };
  }
}
