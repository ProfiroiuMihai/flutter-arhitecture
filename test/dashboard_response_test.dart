import 'package:flutter_template/injection/injection.dart';
import 'package:flutter_template/network/network_service.dart';
import 'package:flutter_template/network/response/dashboard_response.dart';
import 'package:flutter_template/screens/dashboard/dashboard_provider.dart';
import 'package:flutter_test/flutter_test.dart';


class MockNetworkService extends NetworkService {

  @override
  Future getDashboard() {
    return Future.value(mockDashboardResponse);
  }
}

final DashboardResponse mockDashboardResponse =
DashboardResponse(text1: "It works",availableFunds: 200,rubyTitle: "Test title");

void main() {
  setupDependencyInjection();
  var dashboardViewModel = inject<DashboardProvider>();
  dashboardViewModel.networkService = MockNetworkService();


  group('dashboardViewModel', () {
    test('test dashboardViewModel method getDashboard() api response', () async {
      await dashboardViewModel.getDashboard();
      expect(dashboardViewModel.dashboardResponse.text1, "It works");
      expect(dashboardViewModel.dashboardResponse.availableFunds, 200);
      expect(dashboardViewModel.apiResponse.data, mockDashboardResponse);
    });
  });
}
