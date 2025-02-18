import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchDashboardData) {
      yield DashboardLoading();
      try {
        // Simulate fetching data from an API
        final data = await _fetchData();
        yield DashboardLoaded(data);
      } catch (e) {
        yield DashboardError(e.toString());
      }
    }
  }

  Future<Map<String, dynamic>> _fetchData() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    return {
      'totalUsers': 100,
      'recentActivities': ['User A logged in', 'User B updated profile'],
    };
  }
}