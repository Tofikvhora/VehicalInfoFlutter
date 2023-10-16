import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/TranmissionPage.dart';
import 'package:vehicle_app/Widgets/AppBarCommon.dart';
import 'package:vehicle_app/Widgets/CommonContainer.dart';
import 'package:vehicle_app/data/StoreLocalData.dart';
import 'package:vehicle_app/data/staticLIst.dart';

class FuelPage extends HookWidget {
  static const String route = "FuelPage";
  const FuelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Reuse.getAppbar(
          context, "Select Fuel Type", IconlyLight.arrow_left_2),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: fuel.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final data = fuel[index];
                return InkWell(
                  onTap: () {
                    LocalData.fuelType.add(data);
                    print("Fuel Type = ${LocalData.fuelType}");
                    TransmissionPage.route.pushOnThis(context);
                  },
                  child: CommonContainer(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.toString(),
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.w),
                        ),
                        Icon(
                          IconlyBold.arrow_right_2,
                          size: 20.w,
                          color: textColor,
                        )
                      ],
                    ),
                  )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
