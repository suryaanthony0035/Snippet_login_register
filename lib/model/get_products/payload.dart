class ProductPayload {
  String? product;
  int? quantity;

  ProductPayload({this.product, this.quantity});

  @override
  String toString() => 'Payload(product: $product, quantity: $quantity)';

  factory ProductPayload.fromJson(Map<String, dynamic> json) => ProductPayload(
        product: json['product'] as String?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'quantity': quantity,
      };
}
