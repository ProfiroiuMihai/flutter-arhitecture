import 'package:flutter/material.dart';
import 'screens/dashboard/dashboard_screen.dart';


class Router {


  static void showDashboardScreen(context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => DashBoardScreen()));
  }


}
