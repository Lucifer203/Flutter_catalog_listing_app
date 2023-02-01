import 'package:flutter/material.dart';
import 'package:flutter_cataloge/pages/home_page.dart';
import 'package:flutter_cataloge/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Codepur";

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
