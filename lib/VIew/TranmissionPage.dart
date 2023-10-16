import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/ProfilePage.dart';
import 'package:vehicle_app/Widgets/AppBarCommon.dart';
import 'package:vehicle_app/Widgets/CommonContainer.dart';
import 'package:vehicle_app/data/StoreLocalData.dart';
import 'package:vehicle_app/data/staticLIst.dart';

class TransmissionPage extends StatelessWidget {
  static const String route = "TransmissionPage";
  const TransmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Reuse.getAppbar(
          context, "Select Transmission", IconlyLight.arrow_left_2),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: transmission.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final data = transmission[index];
                return InkWell(
                  onTap: () {
                    LocalData.transmissionType.add(data);
                    ProfilePage.route.pushOnThis(context);
                  },
                  child: CommonContainer(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data,
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
