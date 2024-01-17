import 'package:kafil/Models/ServicesModel2.dart';


class Product2State {
  final List<Product2> products;
  final bool isLoading;

  Product2State({required this.products, required this.isLoading});

  factory Product2State.initial() => Product2State(products: [], isLoading: false);

  Product2State copyWith({List<Product2>? products, bool? isLoading}) {
    return Product2State(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}