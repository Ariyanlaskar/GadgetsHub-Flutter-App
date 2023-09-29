import 'package:flutter/material.dart';

import 'package:learning/Widgets/splash_screen.dart';

import 'package:learning/Widgets/theme.dart';

// import 'package:learning/Pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // theme: ThemeData(fontFamily: GoogleFonts.sanchez().fontFamily),
      home: const SplashedScreen(),
    );
  }
}
