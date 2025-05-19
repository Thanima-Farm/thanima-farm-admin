// activities_cubit.dart
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/core/service_locator.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:thanima_admin/features/dashboard/cubit/admin_dashboard_model.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  AdminDashboardCubit() : super(AdminDashboardInitial());
  final apiClient = locator<ApiClient>();
  Future<void> fetchDashboard() async {
    emit(AdminDashboardLoading());
    try {
      final response = await apiClient.request(
        url: "/dev/api/v1/dashbaord",
        requestType: RequestType.GET,
      );
      print("Raw response: ${response.data}");
      final bookingListModel = AdminDashboardModel.fromJson(response.data);

      emit(AdminDashboardLoaded(bookingListModel));

      // 👇 Extract the individual bookings
      final AdminDashboardModel data = bookingListModel;
      print('❌ Raw error: $data');
    } catch (e) {
      print('❌ Raw error: $e');
      if (e is DioException) {
        print("❌ Dio error occurred:");

        emit(AdminDashboardError('Failed to fetch Info: ${e.message}'));
      } else {
        print("❌ Unexpected error: $e");
        emit(AdminDashboardError('Unexpected error: $e'));
      }
    }
  }
}

abstract class AdminDashboardState {}

class AdminDashboardInitial extends AdminDashboardState {}

class AdminDashboardLoading extends AdminDashboardState {}

class AdminDashboardLoaded extends AdminDashboardState {
  final AdminDashboardModel dashboardData;
  AdminDashboardLoaded(this.dashboardData);
}

class AdminDashboardError extends AdminDashboardState {
  final String message;
  AdminDashboardError(this.message);
}
