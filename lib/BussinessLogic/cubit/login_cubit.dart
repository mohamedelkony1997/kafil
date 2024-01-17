// login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:kafil/Models/loginmodel.dart';
import 'package:kafil/Repositery/LoginRepositery.dart';
import 'package:kafil/Screens/Home/HomePage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiRepository apiRepository = ApiRepository();

  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      final request = LoginRequest(email: email, password: password);
      await apiRepository.loginUser(request);
   
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: 'Failed to login. Please try again.'));
    }
  }
}
