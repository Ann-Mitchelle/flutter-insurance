import 'package:get/get.dart';

class LoginController extends GetxController {
  var phonenumber = "".obs;
  updatePhoneNumber(num) {
    phonenumber.value = num;
  }
}
