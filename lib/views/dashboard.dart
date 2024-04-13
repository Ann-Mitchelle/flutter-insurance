// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/controllers/user_controller.dart';
import 'package:insurance/models/insurance_package.dart';
import 'package:insurance/views/customlisttile.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundcopy.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: FutureBuilder(
            future: getInsurancePackages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    Text("Loading"),
                  ],
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.yellow.withOpacity(0.6),
                        ),
                        child: ListTile(
                          onTap: () {},
                          leading: Icon(Icons.house),
                          title: Text(
                            snapshot.data?[index].company ?? "Unknown",
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Premium: "),
                                  Text(
                                    snapshot.data?[index].premium.toString() ??
                                        "0",
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("OutPatient: \$"),
                                  Text(
                                    snapshot.data?[index].outpatient
                                            .toString() ??
                                        "0",
                                  ),
                                  Text("Inpatient: \$"),
                                  Text(
                                    snapshot.data?[index].inpatient
                                            .toString() ??
                                        "0",
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Dental: \$"),
                                  Text(
                                    snapshot.data?[index].dental.toString() ??
                                        "0",
                                  )
                                ],
                              ),
                              Text(
                                "Total: ${snapshot.data?[index].total.toString() ?? '0'}",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Hi, ${userController.user.value?.firstname}"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CListView(
              label: "Enrollment Status",
              action: () => Get.toNamed("/Enroll"),
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

Future<List<InsurancePackage>> getInsurancePackages() async {
  try {
    final response = await http.get(
      Uri.parse("https://sanerylgloann.co.ke/myInsurance/getpackages.php"),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<Map<String, dynamic>> packagesData =
          responseData["package"].cast<Map<String, dynamic>>();
      return packagesData.map((e) => InsurancePackage.fromJson(e)).toList();
    } else {
      Get.snackbar(
        "Error",
        "Error Fetching Packages",
      );
    }
  } catch (e) {
    debugPrint("$e");
  }
  return [];
}
