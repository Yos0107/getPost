import 'package:flutter/widgets.dart';
import 'package:getdatawithpagination/services/getRequest.dart';

class HamroProvider extends ChangeNotifier {
  List _nayaModel = [];

  List get nayaModel => _nayaModel;

  fetchDatafromApi() async {
    _nayaModel = await getData();
    notifyListeners();

    print(_nayaModel);
    print(nayaModel);
  }
}
