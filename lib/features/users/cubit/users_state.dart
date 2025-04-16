// user_state.dart

import 'package:thanima_admin/features/users/user_model.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;

  UsersLoaded(this.users);
}

class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}

class UserCreateSuccess extends UsersState {
  final String message;

  UserCreateSuccess(this.message);
}

class UserCreateFailure extends UsersState {
  final String message;

  UserCreateFailure(this.message);
}
