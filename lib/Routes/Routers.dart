import 'package:flutter/material.dart';
import 'package:vehicle_app/VIew/FuelPage.dart';
import 'package:vehicle_app/VIew/HomePage.dart';
import 'package:vehicle_app/VIew/MakePage.dart';
import 'package:vehicle_app/VIew/ModelsPage.dart';
import 'package:vehicle_app/VIew/ProfilePage.dart';
import 'package:vehicle_app/VIew/SplashPage.dart';
import 'package:vehicle_app/VIew/TranmissionPage.dart';
import 'package:vehicle_app/VIew/VehicleRagPage.dart';

class RoutesOfApp {
  static MaterialPageRoute genRoutes(setting) {
    switch (setting.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case VehicleRagPage.route:
        return MaterialPageRoute(builder: (_) => const VehicleRagPage());
      case MakePage.route:
        return MaterialPageRoute(builder: (_) => const MakePage());
      case ModelsPage.route:
        return MaterialPageRoute(
            settings: setting,
            builder: (_) => ModelsPage(
                  modelName: setting.arguments["data"],
                ));
      case FuelPage.route:
        return MaterialPageRoute(builder: (_) => const FuelPage());
      case TransmissionPage.route:
        return MaterialPageRoute(builder: (_) => const TransmissionPage());
      case ProfilePage.route:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                appBar: AppBar(
                    title: const Text(
                      "Error",
                    ),
                    centerTitle: true)));
    }
  }
}
