import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_app/Providers/ApiProvider.dart';
import 'package:vehicle_app/Routes/Routers.dart';
import 'package:vehicle_app/Utils/Colors.dart';
import 'package:vehicle_app/VIew/SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(350, 680),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesOfApp.genRoutes,
            title: 'Vehicle Info',
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: "main",
                scaffoldBackgroundColor: primaryColor),
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
