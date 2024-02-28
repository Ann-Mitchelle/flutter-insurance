import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtextfield.dart';
import 'package:insurance/views/signup.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
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
                        child: customButton(
                          action: () => Get.toNamed("/Home"),
                          buttonLabel: 'Log in',
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
                                      builder: (context) => signUp()));
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
}
