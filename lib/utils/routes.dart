import 'package:get/get.dart';
import 'package:insurance/views/dashboard.dart';
import 'package:insurance/views/home.dart';
import 'package:insurance/views/profile.dart';
import 'package:insurance/views/signin.dart';
import 'package:insurance/views/signup.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => signIn()),
    GetPage(name: "/SignUp", page: () => signUp()),
    GetPage(name: "/Home", page: () => Home()),
    GetPage(name: "/Dashboard", page: () => Dashboard()),
    GetPage(name: "/Profile", page: () => Profile())
  ];
}
