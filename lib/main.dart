import 'package:flutter/material.dart';
import 'package:sca_ui/views/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: WelcomeScreen(),);
  }
}
