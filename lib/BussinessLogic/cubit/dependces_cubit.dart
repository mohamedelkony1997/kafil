import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/dependces_state.dart';

import 'package:kafil/Models/Usertype.dart';
import 'package:kafil/Repositery/dependicesRepositery.dart';
class ApiCubit extends Cubit<ApiState> {
  final ApiRepository repository = ApiRepository();

  ApiCubit() : super(ApiInitial());

  Future<void> fetchData() async {
    try {
      final apiResponse = await repository.fetchData();
      emit(ApiLoaded(apiResponse.data));
    } catch (e) {
      emit(ApiError("Failed to load data: $e"));
    }
  }
}