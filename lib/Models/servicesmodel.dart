class Product {
  final int id;
  final String mainImage;
  final double price;
  final String title;
  final double averageRating;
  final int completedSalesCount;
  final bool recommended;

  Product({
    required this.id,
    required this.mainImage,
    required this.price,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      mainImage: json['main_image'],
      price: json['price'].toDouble(),
      title: json['title'],
      averageRating: json['average_rating'].toDouble(),
      completedSalesCount: json['completed_sales_count'],
      recommended: json['recommended'],
    );
  }
}
