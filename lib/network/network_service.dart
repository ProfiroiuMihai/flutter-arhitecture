import 'dart:developer';

import 'package:flutter_template/injection/injection.dart';
import 'package:flutter_template/network/response/dashboard_response.dart';

import 'api_base_helper.dart';


class NetworkService {
  ApiBaseHelper _helper = inject<ApiBaseHelper>();
  String devEndpoint = 'https://mnbhpc2s6j.execute-api.us-east-1.amazonaws.com/dev';



  getDasboardExample() async {
    final response = await _helper.get(
        "$devEndpoint/dashboard");
    return DashboardResponse.fromJson(response);
  }

  createAccount() async {
    final response = await _helper.post(
        "$devEndpoint//sendValidationEmail",
        {"email": "test@synasefi.com"});
    return response;
  }

}
