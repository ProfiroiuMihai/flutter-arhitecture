import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/injection/injection.dart';
import 'package:flutter_template/network/api_response.dart';
import 'package:flutter_template/network/network_service.dart';


class CreateAccountProvider extends ChangeNotifier {

  NetworkService networkService = inject<NetworkService>();

  ApiResponse createAccountApi = ApiResponse.loading("init");

  createAccount() async {
    this.createAccountApi = ApiResponse.loading("loading");
    try {
      var response = await this.networkService.createAccount();
      this.createAccountApi = ApiResponse.completed(response);
    } catch (e) {
      this.createAccountApi = ApiResponse.error(e.toString());
      log(e.toString());
    }
    notifyListeners();
  }


}
