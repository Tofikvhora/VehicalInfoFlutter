import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/VehicleRagPage.dart';
import 'package:vehicle_app/Widgets/AppBarCommon.dart';
import 'package:vehicle_app/Widgets/CommonContainer.dart';
import 'package:vehicle_app/data/StoreLocalData.dart';

class HomePage extends HookWidget {
  static const String route = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold);
    final subTextStyle = TextStyle(
        color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w400);
    return Scaffold(
      appBar: Reuse.getAppbar(context, "Vehicle List", null),
      body: LocalData.modelName.isEmpty || LocalData.modelName.isEmpty
          ? Center(child: Text("No vehicle Data Found", style: textStyle))
          : ListView(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ListView.builder(
                    itemCount: LocalData.vehicleNumber.length,
                    itemBuilder: (context, index) {
                      final vehicleNumber = LocalData.vehicleNumber[index];
                      final makeName = LocalData.makeName[index];
                      final modelName = LocalData.modelName[index];
                      return CommonContainer(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  vehicleNumber,
                                  style: textStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      makeName,
                                      style: subTextStyle,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child:
                                          Text(modelName, style: subTextStyle),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // Icon(
                            //   IconlyBold.arrow_right_2,
                            //   size: 25.w,
                            //   color: textColor,
                            // )
                          ],
                        ),
                      ));
                    },
                  ),
                )
              ],
            ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Reuse.getButton(context, () {
        VehicleRagPage.route.pushOnThis(context);
      }, Icons.add),
    );
  }
}
