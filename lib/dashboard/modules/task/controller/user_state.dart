part of 'user_cubit.dart';

// import 'package:commerce_project/dashboard/modules/task/model/entity_model/user_model.dart';
// import 'package:flutter/material.dart';

@immutable
abstract class UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  final UserModel user;

  UserStateLoaded({required this.user});
}

class UserStateEmpty extends UserState {}

class UserStateError extends UserState {
  final String errorMessage;

  UserStateError({required this.errorMessage});
}
