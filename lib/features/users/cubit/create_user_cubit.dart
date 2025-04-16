// import 'package:bloc/bloc.dart';
// import 'package:thanima_admin/core/services/api_client.dart';
// import 'package:thanima_admin/features/users/cubit/users_state.dart';
// import 'package:thanima_admin/features/users/user_model.dart';

// class CreateUserCubit extends Cubit<UsersState> {
//   final ApiClient apiClient;

//   CreateUserCubit(this.apiClient) : super(UsersInitial());

//   Future<void> createUser(dynamic body) async {
//     emit(UsersLoading());
//     try {
//       final response = await apiClient.request(
//         url: "/dev/api/v1/createUser",
//         requestType: RequestType.POST,
//         body: body,
//       );

//       // ✅ Fix: Access the 'data' key first
//       final List<dynamic> jsonList = response.data['data'];
//       final users = jsonList.map((e) => UserModel.fromJson(e)).toList();

//       emit(UsersLoaded(users));
//     } catch (e) {
//       emit(UsersError('Failed to fetch users: $e'));
//     }
//   }
// }
