import 'dart:async';

import 'package:flutter/material.dart';

import 'package:learning/Widgets/homepage.dart';
import 'package:learning/Widgets/log_in.dart';
import 'package:learning/Widgets/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashedScreen extends StatefulWidget {
  const SplashedScreen({super.key});

  @override
  State<SplashedScreen> createState() => _SplashedScreenState();
}

class _SplashedScreenState extends State<SplashedScreen> {
  String keylog = 'logged';
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      isLogged();
    });
    // isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          'Gadgets Hub',
          style: TextStyle(fontSize: 33, color: MyTheme.creamColor),
        ),
      ),
    );
  }

  isLogged() async {
    var pref = await SharedPreferences.getInstance();
    var log = pref.getBool(keylog);

    if (log != null) {
      if (log == true) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => homePage(
                keylog: keylog,
              ),
            ));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogIn(
                logkey: keylog,
              ),
            ));
      }
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(
              logkey: keylog,
            ),
          ));
    }
  }
}
