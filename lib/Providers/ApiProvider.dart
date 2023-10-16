import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/Models/TwoWhellerModel.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/data/Apikeys.dart';

class ApiProvider extends ChangeNotifier {
  Future<TwoWheller?> fetchApi(BuildContext context, String api) async {
    try {
      final response = await Dio()
          .get(api, options: Options(headers: {"api-key": ApiKeys.apikey}));
      if (response.statusCode == 200) {
        final data = TwoWheller.fromJson(response.data);
        return data;
      } else {
        print("nothing");
      }
    } on DioException catch (er) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: secondaryColor,
          content: Text("Error While Fetch Data ${er.message}",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w200,
                  color: textColor))));
    }
  }
}
