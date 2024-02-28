import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customlisttile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroundcopy.jpg"),
                fit: BoxFit.cover)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CListView(
              label: "Enrollment Status",
              action: () => Get.toNamed("/Enrollment"),
            ),
            CListView(
              label: "Package Details",
              action: () => Get.toNamed("/Details"),
            ),
            CListView(
              label: "Transaction History",
              action: () => Get.toNamed("/History"),
            ),
            CListView(
              label: "Sign Out",
              action: () => Get.toNamed("/"),
            ),
          ],
        ),
      ),
    );
  }
}
