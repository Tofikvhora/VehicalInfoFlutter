import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/HomePage.dart';

class SplashPage extends HookWidget {
  static const String route = "SplashPage";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headingText = TextStyle(
        color: textColor, fontSize: 25.sp, fontWeight: FontWeight.bold);
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        HomePage.route.pushAndReplace(context);
      });
    }, []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset("asset/images/Car.json"),
          Text(
            "The Vehicle Mark",
            style: headingText,
          )
        ],
      ),
    );
  }
}
