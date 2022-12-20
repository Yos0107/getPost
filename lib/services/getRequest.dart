import 'package:dio/dio.dart';
import 'package:getdatawithpagination/viewModels/productModel.dart';

Future getData(int page) async {
  try {
    var response = await Dio()
        .get("https://api.instantwebtools.net/v1/passenger?page=$page&size=13");

    if (response.statusCode == 200) {
      final body = response.data;
      HamroModel model = HamroModel.fromJson(body);
      return model.data;
    } else {
      print("hello ma error o ");
    }
  } catch (e) {
    return e.toString();
  }
}
