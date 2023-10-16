import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/Utils/Colors.dart';

class CommonContainer extends HookWidget {
  final Widget child;
  const CommonContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.h),
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                  color: textColor,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: Offset(1.5, 1))
            ]),
        child: child);
  }
}
