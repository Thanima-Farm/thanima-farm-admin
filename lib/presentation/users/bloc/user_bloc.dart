import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/presentation/users/viewmodels/user_model.dart';

// Events
abstract class UserEvent {}

class LoadUsers extends UserEvent {}

class ToggleStatus extends UserEvent {
  final String serial;
  ToggleStatus(this.serial);
}

// State
class UserState {
  final List<User> users;
  UserState({required this.users});
}

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserState(users: [
          User(serial: "01", name: "Aadarsh Soni", contact: "+91-9876543214", mail: "aada@gmail.com", role: "Supervisor", username: "aada101", password: "Admin@12345#", status: "Active"),
          User(serial: "02", name: "Abhinav Singh", contact: "+91-9876543214", mail: "aada@gmail.com", role: "Supervisor", username: "abhi102", password: "Admin@12345#", status: "Active"),
          User(serial: "03", name: "Sourav", contact: "+91-9876543214", mail: "aada@gmail.com", role: "House Keeping", username: "sour103", password: "Admin@12345#", status: "Active"),
          User(serial: "04", name: "Shukla", contact: "+91-9876543214", mail: "aada@gmail.com", role: "Guides", username: "shuk104", password: "Admin@12345#", status: "Disable"),
        ])) {
    on<ToggleStatus>((event, emit) {
      final updatedUsers = state.users.map((user) {
        if (user.serial == event.serial) {
          user.status = user.status == "Active" ? "Disable" : "Active";
        }
        return user;
      }).toList();
      emit(UserState(users: updatedUsers));
    });
  }
}