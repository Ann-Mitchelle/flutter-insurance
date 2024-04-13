// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtextfield.dart';
import 'package:insurance/views/reset.dart';
import 'package:insurance/views/signup.dart';
import 'package:http/http.dart' as http;

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {
                            signin();
                            Get.toNamed("/Home");
                          },
                          child: const Text("LOGIN"),
                          style: ElevatedButton.styleFrom(
                              elevation: 10, padding: const EdgeInsets.all(15)),
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

  Future<void> signin() async {
    http.Response response;

    response = await http.get(
      Uri.parse(
          'https://sanerylgloann.co.ke/Ann_insurance/login.php?email=${emailController.text.trim()}&password=${passwordController.text.trim()}'),
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      debugPrint("Ok!");
      var serverResponse = json.decode(response.body);
      int loginServer = serverResponse['success'];
      if (loginServer == 1) {
        Get.offAndToNamed("/Home");
      } else {
        print("email or password is incorrect");
        // Get.snackbar("Error", "An error occured $response.statusCode");
      }
    }
  }
}
