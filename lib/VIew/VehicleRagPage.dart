import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/MakePage.dart';
import 'package:vehicle_app/data/StoreLocalData.dart';

import '../Widgets/AppBarCommon.dart';

class VehicleRagPage extends HookWidget {
  static const String route = "VehicleRagPage";
  const VehicleRagPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontSize: 15.sp,
        color: textColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.w);
    final controller = useTextEditingController();
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: Reuse.getAppbar(
          context, "Create New Vehicle Profile", IconlyLight.arrow_left_2),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        children: [
          Text(
            "Vehicle Number",
            style: style,
          ),
          SizedBox(height: 8.h),
          Form(
            key: key,
            child: TextFormField(
              textCapitalization: TextCapitalization.characters,
              cursorColor: textColor,
              cursorWidth: 1.5,
              cursorOpacityAnimates: true,
              onFieldSubmitted: (value) {},
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your vehicle number*";
                }
                return null;
              },
              style: style,
              enabled: true,
              enableSuggestions: true,
              controller: controller,
              maxLength: 10,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.w),
                counterText: "",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red.withOpacity(0.5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: secondaryColor),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Reuse.getButton(context, () {
        if (key.currentState!.validate()) {
          MakePage.route.pushOnThis(context);
          LocalData.vehicleNumber.addAll([controller.text]);
          print(LocalData.vehicleNumber);
        }
      }, IconlyLight.arrow_right_2),
    );
  }
}
