
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/Models/Usertype.dart';
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoaded extends ApiState {
  final ApiData data;

  ApiLoaded(this.data);
}

class ApiError extends ApiState {
  final String error;

  ApiError(this.error);
}
