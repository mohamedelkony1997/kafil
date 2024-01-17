import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafil/BussinessLogic/cubit/register_state.dart';
import 'package:kafil/Models/Userdata.dart';

import 'package:kafil/Repositery/RegisterRepositery.dart';



class RegistrationCubit extends Cubit<RegistrationState> {
  final UserRepository userRepository = UserRepository();

  RegistrationCubit() : super(RegistrationInitial());

  Future<void> registerUser(UserModel user) async {
    try {
      emit(RegistrationLoading());
      await userRepository.registerUser(user);
      emit(RegistrationSuccess());
    } catch (error) {
      emit(RegistrationError(error.toString()));
    }
  }
}
