// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insurance/config/constants.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtextfield.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RESET YOUR PASSWORD"),
          backgroundColor: primaryColor,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter your email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => ("/"),
                child: Text("Send reset email"),
              ),

              //  ElevatedButton(onPressed: () {}, child: Text("Send reset email")),
            ])));
  }
}
