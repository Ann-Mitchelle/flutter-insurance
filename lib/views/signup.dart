// ignore_for_file: prefer_const_constructors, must_be_immutable, camel_case_types, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/config/constants.dart';
import 'package:insurance/controllers/signupcontroller.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtextfield.dart';

import 'package:insurance/views/home.dart';
import 'package:insurance/views/signin.dart';
import 'package:http/http.dart' as http;

class signUp extends StatelessWidget {
  //SignUpController signupController = Get.put(SignUpController());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () async => await Get.toNamed("/homepage")),
          automaticallyImplyLeading: true,
        ),
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
                    " Fill in the form to sign up",
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
                              userFieldController: phoneController,
                              icon: Icons.phone,
                              hideText: false,
                              isPassword: false,
                              hint: "Phone",
                            )),
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
                          child: ElevatedButton(
                              onPressed: () async {
                                final ok = await signup();
                                if (ok) {
                                  Get.toNamed("/");
                                }
                              },
                              child: Text("Sign Up")),
                          /*final buttonStyle styling =  ElevatedButton.styleFrom(
                            primary: Colors.blue, // Background color
                            onPrimary: Colors.white, // Text color
                            elevation: 5, // Elevation
                            minimumSize: Size(200, 50), // Minimum size
                            shape: RoundedRectangleBorder(
                              // Button border
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );*/
                        ),

                        /*    signupController.firstName.value =
                                  firstNameController.text;
                              signupController.secondName.value =
                                  lastNameController.text;
                              signupController.email.value =
                                  emailController.text;
                              signupController.phoneNumber.value =
                                  phoneController.text;
                              // Get.toNamed("/");
                              */
                        //print('Method called');

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signIn()));
                              },
                              child: const Text("Login"),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )));
  }

  Future<bool> signup() async {
    var body = {
      'firstname': firstNameController.text.trim(),
      'lastname': lastNameController.text.trim(),
      'phonenumber': phoneController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse('https://sanerylgloann.co.ke/myInsurance/signup.php'),
        body: json.encode(body),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        Get.snackbar("Signup Error", "Error sending post");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
    return false;
  }
}
