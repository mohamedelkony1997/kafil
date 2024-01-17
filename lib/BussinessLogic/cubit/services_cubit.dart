import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/services_state.dart';
import 'package:kafil/Models/servicesmodel.dart';
import 'package:kafil/Repositery/services1Repositery.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository = ProductRepository();

  ProductCubit() : super(ProductState.initial());

  Future<void> fetchProducts() async {
    emit(state.copyWith(isLoading: true));

    try {
      final List<Product> products = await _repository.fetchProducts();
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}