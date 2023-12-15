import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

import 'ui/controllers/cancelled_task_controller.dart';
import 'ui/controllers/completed_task_controller.dart';
import 'ui/controllers/login_controller.dart';
import 'ui/controllers/new_task_controller.dart';
import 'ui/controllers/progress_task_controller.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigationKey,
      home: const SplashScreen(),
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10),
          )
        )
      ),
      initialBinding: ControllerBinder(),
    );
  }
}

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LoginController());
    Get.put(NewTaskController());
    Get.put(ProgressTaskController());
    Get.put(CompletedTaskController());
    Get.put(CancelledTaskController());

  }

}
