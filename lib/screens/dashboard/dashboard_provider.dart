import 'package:flutter/foundation.dart';
import 'package:flutter_template/injection/injection.dart';
import 'package:flutter_template/network/api_response.dart';
import 'package:flutter_template/network/network_service.dart';
import 'package:flutter_template/network/response/dashboard_response.dart';


class DashboardProvider extends ChangeNotifier {
  DashboardResponse dashboardResponse = new DashboardResponse();
  NetworkService networkService = inject<NetworkService>();

  ApiResponse apiResponse = new ApiResponse.loading("init");

  getExampleDashboard() async {
    try {
      DashboardResponse response =
          await this.networkService.getDasboardExample();
      this.apiResponse = ApiResponse.completed(response);

      dashboardResponse = response;
      notifyListeners();
    } catch (e) {
      this.apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
