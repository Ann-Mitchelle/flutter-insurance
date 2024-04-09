import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/route_manager.dart';
import 'package:insurance/utils/routes.dart';
import 'package:insurance/views/home.dart';
import 'package:insurance/views/signin.dart';
import 'package:insurance/views/signup.dart';

void main() {
  runApp(GetMaterialApp(
    routes: {
      "/": (context) => signIn(),
      "/SignUp": (context) => signUp(),
      "/Home": (context) => Home(),
    },
    initialRoute: "/",
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
  ));
}
