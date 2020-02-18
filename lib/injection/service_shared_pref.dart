


import 'package:shared_preferences/shared_preferences.dart';

class ProviderSharedPreferences  {

  Future<int> getCounterValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('counter_int_key') ?? 0;
  }


  Future<void> saveCounterValue(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter_int_key', value);
  }
}