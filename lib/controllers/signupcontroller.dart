import 'package:get/get.dart';

class SignUpController extends GetxController {
  var firstName = "".obs;
  var secondName = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;
  updateValues(a, b, c, d) {
    firstName.value = a;
    secondName.value = b;
    email.value = c;
    phoneNumber.value = d;
  }
}
