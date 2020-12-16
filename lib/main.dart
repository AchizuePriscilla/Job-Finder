import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sca_ui/routes/route_generator.dart';
import 'package:sca_ui/routes/route_names.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RouteNames.routes,
      initialRoute: RouteNames.welcomeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
