import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_tool_app/core/values/app_values.dart';
import 'package:fund_tool_app/data/secure_storage/secure_storage.dart';
import 'package:fund_tool_app/modules/home_screen/home_screen.dart';
import 'package:fund_tool_app/modules/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    time();
  }

  time() async {
    Timer(
      const Duration(seconds: 3),
      () async {
        String isLoggedIn =
            await SecureStorage.readSecureData(AppValues.IS_LOGGED_IN);
        if (isLoggedIn == '1') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
        }
        //   }
        // });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/splash.png",
              height: 1.sh,
              width: 1.sw,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 55.h,
            ),
          ],
        ),
      ),
    );
  }
}
