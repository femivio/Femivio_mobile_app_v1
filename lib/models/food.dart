class Food {
  final String name;
  final String imageUrl;
  final double price;

  Food({required this.name, required this.imageUrl, required this.price});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }
}
