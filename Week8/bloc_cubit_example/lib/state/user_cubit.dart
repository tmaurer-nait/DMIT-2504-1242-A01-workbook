import 'package:bloc_cubit_example/models/user.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// Wraps our user instance
class UserState {
  User user;
  UserState(this.user);
}

class UserCubit extends Cubit<UserState> {
  // Initialize the cubit with a default user
  UserCubit() : super(UserState(User('Bobby', 'Marlone')));

  // Method to emit events for an updated user
  void updateUser(User user) {
    return emit(UserState(user));
  }
}
