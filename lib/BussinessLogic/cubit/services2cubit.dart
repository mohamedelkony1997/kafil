import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/services2state.dart';
import 'package:kafil/Models/ServicesModel2.dart';
import 'package:kafil/Repositery/Service2Repositery.dart';

class Product2Cubit extends Cubit<Product2State> {
  final Product2Repository _repository = Product2Repository();

  Product2Cubit() : super(Product2State.initial());

  Future<void> fetchProducts2() async {
    emit(state.copyWith(isLoading: true));

    try {
      final List<Product2> products = await _repository.fetchProducts2();
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}