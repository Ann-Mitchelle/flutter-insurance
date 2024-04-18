import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  final productList = [].obs;
  updateProductList(list) {
    productList.value = list;
  }
}
