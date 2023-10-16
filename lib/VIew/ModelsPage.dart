import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_app/Models/TwoWhellerModel.dart';
import 'package:vehicle_app/Providers/ApiProvider.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/Utils/StringNavigation.dart';
import 'package:vehicle_app/VIew/FuelPage.dart';
import 'package:vehicle_app/Widgets/AppBarCommon.dart';
import 'package:vehicle_app/Widgets/CommonContainer.dart';
import 'package:vehicle_app/data/Apikeys.dart';
import 'package:vehicle_app/data/StoreLocalData.dart';

class ModelsPage extends HookWidget {
  static const String route = "ModelsPage";
  final String modelName;
  const ModelsPage({super.key, required this.modelName});

  @override
  Widget build(BuildContext context) {
    final apiNotifier = Provider.of<ApiProvider>(context);
    final resData = useState<TwoWheller?>(null);
    useEffect(() {
      Future.microtask(() async {
        resData.value =
            await apiNotifier.fetchApi(context, ApiKeys.modelApi + modelName);
      });
      LocalData.makeName.add(modelName);
      print("Make Name = ${LocalData.makeName}");
      return null;
    }, []);
    return Scaffold(
      appBar:
          Reuse.getAppbar(context, "Select Model", IconlyLight.arrow_left_2),
      body: resData.value == null
          ? const Center(
              child: CircularProgressIndicator(
                color: textColor,
              ),
            )
          : ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ListView.builder(
                    itemCount: resData.value!.data!.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final items = resData.value!.data![index];
                      return InkWell(
                        onTap: () {
                          LocalData.modelName.add(items.brand.toString());
                          print("Mode Name : ${LocalData.modelName}");
                          FuelPage.route.pushOnThis(context);
                        },
                        child: CommonContainer(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items.brand.toString(),
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
