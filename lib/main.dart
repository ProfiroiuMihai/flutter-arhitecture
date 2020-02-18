import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/screens/create_account/create_account_provider.dart';
import 'package:flutter_template/screens/create_account/create_account_screen.dart';
import 'package:flutter_template/screens/dashboard/dashboard_provider.dart';
import 'package:provider/provider.dart';

import 'injection/injection.dart';


void main() {
  setupDependencyInjection();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: DashboardProvider()),
          ChangeNotifierProvider.value(value: CreateAccountProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.deepPurple[800],
            accentColor: Colors.deepPurple[600],
          ),
          home: Scaffold(
            body: CreateAccountScreen(),
          ),
        ));
  }
}
