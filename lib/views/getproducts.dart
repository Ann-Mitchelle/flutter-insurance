import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:insurance/controllers/productcontroller.dart';
import 'package:insurance/controllers/signupcontroller.dart';
import 'package:insurance/models/packagemodel.dart';

ProductController productController = Get.put(ProductController());
SignUpController signUpController = Get.put(SignUpController());

class MyPackages extends StatelessWidget {
  const MyPackages({super.key});

  @override
  Widget build(BuildContext context) {
    getPackage().then((value) => null);
    return Obx(() => productController.productList.isEmpty
        ? Center(
            child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: 12,
            //productController.productList.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text('Product $index'),
                subtitle: Text(productController.productList[index].name),
                leading: Icon(Icons.ac_unit),
                trailing: MaterialButton(
                  onPressed: () {
                    //order(productController.productList[index].id, signUpController. );
                  },
                  child: Text('Buy'),
                  color: Colors.amber,
                ),
              ));
            }));
  }

  Future<void> getPackage() async {
    http.Response response = await http.get(
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      Uri.parse('https://sanerylgloann.co.ke/myInsurance/getpackages.php'),
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      debugPrint("Ok!");
      var serverResponse = json.decode(response.body);
      var dataDetails = serverResponse['data'];
      var productList =
          dataDetails.map((data) => PackageModel.fromJson(data)).toList();
      productController.updateProductList(productList);
    }
  }

  Future<void> order(id) async {
    var body = {
      'phonenumber': id,
      'package_id': id,
    };

    final response = await http.post(
      Uri.parse('https://sanerylgloann.co.ke/myInsurance/order.php'),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //print(response.body);
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp = serverResponse['success'];
      if (signedUp == 1) {
        Get.offAndToNamed("/homepage");
      } else {
        print("Hello");
      }
    }
  }
}
