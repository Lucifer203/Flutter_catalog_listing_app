import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_cataloge/core/store.dart';
import 'package:flutter_cataloge/pages/cart_page.dart';
import 'package:flutter_cataloge/pages/home_page.dart';
import 'package:flutter_cataloge/pages/login_page.dart';
import 'package:flutter_cataloge/utils/routes.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Codepur";

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
