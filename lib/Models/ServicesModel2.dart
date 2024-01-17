class Product2 {
  final int id;
  final String mainImage;
  final double price;
  final dynamic discount; 
  final double priceAfterDiscount;
  final String title;
  final double averageRating;
  final int completedSalesCount;
  final bool recommended;

  Product2({
    required this.id,
    required this.mainImage,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory Product2.fromJson(Map<String, dynamic> json) {
    return Product2(
      id: json['id'],
      mainImage: json['main_image'],
      price: json['price'].toDouble(),
      discount: json['discount'],
      priceAfterDiscount: json['price_after_discount'].toDouble(),
      title: json['title'],
      averageRating: json['average_rating'].toDouble(),
      completedSalesCount: json['completed_sales_count'],
      recommended: json['recommended'],
    );
  }
}