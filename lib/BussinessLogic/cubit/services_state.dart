import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/Models/servicesmodel.dart';


class ProductState {
  final List<Product> products;
  final bool isLoading;

  ProductState({required this.products, required this.isLoading});

  factory ProductState.initial() => ProductState(products: [], isLoading: false);

  ProductState copyWith({List<Product>? products, bool? isLoading}) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}