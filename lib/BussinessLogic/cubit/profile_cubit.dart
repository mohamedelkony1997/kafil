import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/profile_state.dart';
import 'package:kafil/Models/profile.dart';
import 'package:kafil/Repositery/profilerep.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final UserRepositorydetails userRepositorydetails;

  UserDetailCubit(this.userRepositorydetails) : super(UserDetailInitial());


  Future<void> getUserDetails() async {
    emit(UserDetailLoading());
    try {
      final userData = await userRepositorydetails.getUserDetails();
      emit(UserDetailLoaded(userData));
    } catch (e) {
      emit(UserDetailError('Failed to load user details'));
    }
  }
}
