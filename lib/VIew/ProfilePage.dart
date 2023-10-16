import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/HomePage.dart';
import 'package:vehicle_app/data/StoreLocalData.dart';

class ProfilePage extends HookWidget {
  static const String route = "ProfilePage";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 18.sp,
      color: primaryColor,
      fontWeight: FontWeight.w300,
    );
    final subTextStyle = TextStyle(
        fontSize: 15.sp, color: primaryColor, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: textColor,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${LocalData.modelName[LocalData.modelName.length - 1]} ${LocalData.fuelType[LocalData.fuelType.length - 1]}",
                          style: TextStyle(
                              fontSize: 23.sp,
                              color: textColor,
                              fontWeight: FontWeight.w300)),
                      Text(
                        LocalData
                            .vehicleNumber[LocalData.vehicleNumber.length - 1],
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          HomePage.route.pushOnThis(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 15.h),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: secondaryColor),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.sp,
                                letterSpacing: 1.w,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   width: MediaQuery.of(context).size.width,
          //   child: GridView.builder(
          //       shrinkWrap: true,
          //       itemCount: 1,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 1,
          //         childAspectRatio: 2.5,
          //       ),
          //       itemBuilder: (context, index) {
          //         return Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 Column(
          //                   children: [
          //                     Text(
          //                       "Make",
          //                       style: style,
          //                     ),
          //                     Text(
          //                       LocalData.makeName[index],
          //                       style: subTextStyle,
          //                     )
          //                   ],
          //                 ),
          //                 Column(
          //                   children: [
          //                     Text(
          //                       "Model",
          //                       style: style,
          //                     ),
          //                     Text(
          //                       LocalData.modelName[index],
          //                       style: subTextStyle,
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 Column(
          //                   children: [
          //                     Text(
          //                       "Fuel Type",
          //                       style: style,
          //                     ),
          //                     Text(
          //                       LocalData.fuelType[index],
          //                       style: subTextStyle,
          //                     )
          //                   ],
          //                 ),
          //                 Column(
          //                   children: [
          //                     Text(
          //                       "Transmission",
          //                       style: style,
          //                     ),
          //                     Text(
          //                       LocalData.transmissionType[index],
          //                       style: subTextStyle,
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ],
          //         );
          //       }),
          // )
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Make",
                      style: style,
                    ),
                    Text(
                      LocalData.makeName[LocalData.makeName.length - 1],
                      style: subTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Model",
                      style: style,
                    ),
                    Text(
                      LocalData.modelName[LocalData.modelName.length - 1],
                      style: subTextStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Fuel Type",
                    style: style,
                  ),
                  Text(
                    LocalData.fuelType[LocalData.fuelType.length - 1],
                    style: subTextStyle,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Transmission",
                    style: style,
                  ),
                  Text(
                    LocalData.transmissionType[
                        LocalData.transmissionType.length - 1],
                    style: subTextStyle,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
