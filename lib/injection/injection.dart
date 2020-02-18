import 'package:flutter_template/injection/service_shared_pref.dart';
import 'package:flutter_template/network/api_base_helper.dart';
import 'package:flutter_template/network/network_service.dart';
import 'package:flutter_template/screens/create_account/create_account_provider.dart';
import 'package:flutter_template/screens/dashboard/dashboard_provider.dart';
import 'package:get_it/get_it.dart';


GetIt inject = GetIt.instance;

void setupDependencyInjection() {

  inject.registerLazySingleton(() => NetworkService());
  inject.registerLazySingleton(() => ApiBaseHelper());
  inject.registerLazySingleton(() => ProviderSharedPreferences());


  inject.registerFactory(() => CreateAccountProvider());
  inject.registerFactory(() => DashboardProvider());
}
