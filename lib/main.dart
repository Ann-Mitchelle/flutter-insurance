import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/controllers/user_controller.dart';
import 'package:insurance/utils/routes.dart';

void main() {
  Get.put(UserController());
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
