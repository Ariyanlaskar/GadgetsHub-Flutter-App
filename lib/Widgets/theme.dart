import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      secondaryHeaderColor: Colors.white,
      brightness: Brightness.light,
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(255, 95, 95, 95)),

      // buttonColor: darkBluishColor,
      // accentColor: darkBluishColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(MyTheme.darkBluishColor))),
      highlightColor: darkBluishColor,
      textTheme: TextTheme(
          // bodyLarge: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: darkBluishColor),
          bodyMedium: TextStyle(color: darkBluishColor)),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        // textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      secondaryHeaderColor: Colors.black,
      canvasColor: darkCreamColor,
      highlightColor: Colors.white,
      textTheme: const TextTheme(
          // bodyLarge: TextStyle(),
          bodySmall: TextStyle(
            color: Color.fromARGB(255, 149, 148, 148),
          ),
          bodyMedium: TextStyle(color: Color.fromARGB(255, 186, 183, 183))),
      // buttonColor: lightBluishColor,
      // accentColor: Colors.white,
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(255, 71, 97, 110)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(MyTheme.lightBluishColor))),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 226, 223, 223)),
        // textTheme: Theme.of(context).textTheme.copyWith(
        //       headline6:
        //           context.textTheme.headline6.copyWith(color: Colors.white),
        //     ),
      ));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
