import 'package:kafil/Models/profile.dart';

// Define the states for the UserDetailCubit
abstract class UserDetailState {}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserData userData;

  UserDetailLoaded(this.userData);
}

class UserDetailError extends UserDetailState {
  final String errorMessage;

  UserDetailError(this.errorMessage);
}

// Define the events for the UserDetailCubit
abstract class UserDetailEvent {}

class GetUserDetailsEvent extends UserDetailEvent {
  final String authToken;

  GetUserDetailsEvent(this.authToken);
}
