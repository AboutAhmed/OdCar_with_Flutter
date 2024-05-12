import 'package:flutter/material.dart';
import 'package:odcar/Utilities/colors.dart';
import 'package:odcar/Utilities//constants.dart';
import 'package:odcar/View/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      theme: ThemeData(
          primarySwatch: MyColors.green,
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xff00803e03),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: .2,
              titleTextStyle:
              TextStyle(fontFamily: Bold, color: Color(0xff00803e03)),
              iconTheme: IconThemeData(color: MyColors.primaryColor))),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: MyColors.green,
          scaffoldBackgroundColor: const Color(0xff00803e03),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: .2,
              titleTextStyle:
              TextStyle(fontFamily: Bold, color: Color(0xff00803e03)),
              iconTheme: IconThemeData(color: MyColors.primaryColor))),
      home: const SplashScreen(),
    );
  }
}
