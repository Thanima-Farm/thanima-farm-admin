import 'package:bloc/bloc.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:thanima_admin/features/users/cubit/users_state.dart';
import 'package:thanima_admin/features/users/user_model.dart';

class UsersCubit extends Cubit<UsersState> {
  final ApiClient apiClient;

  UsersCubit(this.apiClient) : super(UsersInitial());

  Future<void> createUser(Map<String, dynamic> userData) async {
    emit(UsersLoading());
    try {
      final response = await apiClient.request(
        url: "/dev/api/v1/createUser",
        requestType: RequestType.POST,
        body: userData,
      );
      print(response.data);
      // Optional: fetch users again after creation
      // fetchUsers();
      emit(UserCreateSuccess("User created successfully"));
      fetchUsers();
    } catch (e) {
      print(e);
      emit(UserCreateFailure("Failed to create user"));
    }
  }

  Future<void> fetchUsers() async {
    emit(UsersLoading());
    try {
      final response = await apiClient.request(
        url: "/dev/api/v1/getUsers",
        requestType: RequestType.GET,
      );

      // ✅ Fix: Access the 'data' key first
      final List<dynamic> jsonList = response.data['data'];
      final users = jsonList.map((e) => UserModel.fromJson(e)).toList();

      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError('Failed to fetch users: $e'));
    }
  }
}
