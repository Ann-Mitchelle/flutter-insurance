import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:insurance/controllers/productcontroller.dart';
import 'package:insurance/models/packagemodel.dart';

ProductController productController = Get.put(ProductController());

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
                //traiing: MaterialButton(onPressed: (){}, child: Text('Buy')),
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
}
