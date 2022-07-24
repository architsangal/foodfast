class CartItem {
  final String id;
  final String title;
  late int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  factory CartItem.fromJson(dynamic json) {
    return CartItem(
      id: json[0],
      title: json[1],
      quantity: json[2],
      price: json[3],
    );
  }
}
