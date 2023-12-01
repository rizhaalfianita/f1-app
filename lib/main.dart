import 'package:f1_app/app/modules/detection/controllers/detection_controller.dart';
import 'package:f1_app/app/modules/track_map/controllers/track_map_controller.dart';
import 'package:f1_app/app/notifications/local_notifications.dart';
import 'package:f1_app/app/preferences/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  Get.put(TrackMapController());
  Get.put(DetectionController());
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        themeMode: ThemeMode.system,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        builder: (context, child) {
          final themeController = Get.put(ThemeController());
          return Obx(() {
            return MaterialApp(
              themeMode: themeController.isDarkMode.value
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              home: child,
              debugShowCheckedModeBanner: false,
            );
          });
        }),
  );
}
