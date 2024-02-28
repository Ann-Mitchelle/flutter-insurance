import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/config/constants.dart';
import 'package:insurance/controllers/signupcontroller.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtextfield.dart';

import 'package:insurance/views/home.dart';

class signUp extends StatelessWidget {
  SignUpController signupController = Get.put(SignUpController());

  signUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backgroundcopy.jpg"),
                    fit: BoxFit.cover)),
            child: SafeArea(
              minimum: EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "WELCOME TO BETTER INSURANCE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "W Fill in the form to sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: appBlackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white.withOpacity(0.8),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: firstNameController,
                            hideText: false,
                            isPassword: false,
                            hint: "First Name",
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: lastNameController,
                            hideText: false,
                            isPassword: false,
                            hint: "Last Name",
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: emailController,
                            icon: Icons.email,
                            hideText: false,
                            isPassword: false,
                            hint: "Email",
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: phoneController,
                            icon: Icons.phone,
                            hideText: false,
                            isPassword: false,
                            hint: "Phone",
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: passwordController,
                            icon: Icons.lock,
                            hideText: true,
                            isPassword: true,
                            hint: "Password",
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: confirmPasswordController,
                            icon: Icons.lock,
                            hideText: true,
                            isPassword: true,
                            hint: "Confirm Password",
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: customButton(
                            action: () {
                              signupController.firstName.value =
                                  firstNameController.text;
                              signupController.secondName.value =
                                  lastNameController.text;
                              signupController.email.value =
                                  emailController.text;
                              signupController.phoneNumber.value =
                                  phoneController.text;
                              Get.toNamed("/");
                            },
                            buttonLabel: 'Sign up',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )));
  }
}
