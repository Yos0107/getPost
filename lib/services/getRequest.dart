import 'package:dio/dio.dart';
import 'package:getdatawithpagination/viewModels/productModel.dart';

Future getData() async {
  var response = await Dio().get("https://dummyjson.com/products");
  //final body = response.data;

  final model = HamroModel.fromJson(response.data);
  print(model.products);
  return model.products;
  // try {
  //   if (response.statusCode == 200) {
  //     final body = response.data;

  //     final model = HamroModel.fromJson(response.data);
  //     print(model.products);
  //     return model.products;
  //   } else {
  //     print("hello ma error o ");
  //   }
  // } catch (e) {
  //   return e.toString();
  // }
}
