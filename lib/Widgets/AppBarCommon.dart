import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/Utils/Colors.dart';

class Reuse {
  static getAppbar(BuildContext context, String title, IconData? icon) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 2,
      title: Text(title,
          style: TextStyle(
              fontSize: 15.sp,
              color: textColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.w)),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          icon,
          size: 20.w,
          color: textColor,
        ),
      ),
    );
  }

  static getButton(BuildContext context, Function() onTap, IconData icons) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onTap,
      backgroundColor: secondaryColor,
      elevation: 0,
      heroTag: "Rag",
      isExtended: true,
      splashColor: primaryColor,
      child: Icon(
        icons,
        size: 20.w,
        color: textColor,
      ),
    );
  }
}
