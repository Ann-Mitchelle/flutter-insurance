import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insurance/config/constants.dart';
import 'package:insurance/controllers/signupcontroller.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtext.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.find<SignUpController>();
    SignUpController signupController = Get.put(SignUpController());
    return Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: primaryColor,
          title: customText(label: "Hello ${signUpController.firstName.value}"),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/profile.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    height: 300,
                    width: 300,
                    color: Colors.white.withOpacity(0.4),
                    child: Column(children: [
                      Text(signUpController.firstName.value),
                      SizedBox(
                        height: 10,
                      ),
                      Text(signUpController.secondName.value),
                      SizedBox(
                        height: 10,
                      ),
                      Text(signUpController.email.value),
                      SizedBox(
                        height: 10,
                      ),
                      Text(signUpController.phoneNumber.value),
                    ])),
                customButton(
                    buttonLabel: "Edit Profile",
                    action: () => Get.toNamed("/EditProfile")),
              ]),
        ));
  }
}
