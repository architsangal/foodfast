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
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}
