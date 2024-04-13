// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/controllers/user_controller.dart';
import 'package:insurance/models/user.dart';
import 'package:insurance/views/customtextfield.dart';
import 'package:insurance/views/reset.dart';
import 'package:insurance/views/signup.dart';
import 'package:http/http.dart' as http;

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/backgroundcopy.jpg"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          minimum: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Better Health",
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
                  "Log in to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white.withOpacity(0.4),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width,
                        child: customTextField(
                          userFieldController: emailController,
                          icon: Icons.email,
                          hideText: false,
                          isPassword: false,
                          hint: "email",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          width: MediaQuery.of(context).size.width,
                          child: customTextField(
                            userFieldController: passwordController,
                            icon: Icons.lock,
                            hideText: true,
                            isPassword: true,
                            hint: "password",
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            debugPrint("Here");
                            await signin(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 10, padding: const EdgeInsets.all(15)),
                          child: const Text("Login"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Forgot your password?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Reset()));
                            },
                            child: const Text("Reset"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signUp()));
                            },
                            child: const Text("Sign up"),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signin(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://sanerylgloann.co.ke/myInsurance/login.php?email=${email.trim()}&password=${password.trim()}',
        ),
      );
      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        int loginServer = serverResponse['success'];
        if (loginServer == 1) {
          Get.snackbar(
            "Success",
            "You were successfully authenticated",
          );

          final userController = Get.find<UserController>();
          userController.user.value =
              User.fromJson(serverResponse["userdata"][0]);
          Get.offAndToNamed("/Home");
        } else {
          Get.snackbar(
            "Authentication Error",
            "Please check your email and password and try again",
          );
          // Get.snackbar("Error", "An error occured $response.statusCode");
        }
      }
    } catch (e) {
      Get.snackbar(
        "Exception",
        "Exception: ${e.toString()}",
      );
    }
  }
}
