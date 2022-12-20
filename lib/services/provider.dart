import 'package:flutter/widgets.dart';
import 'package:getdatawithpagination/services/getRequest.dart';

class HamroProvider extends ChangeNotifier {
  List _nayaModel = [];

  List get nayaModel => _nayaModel;

  fetchDatafromApi(int page) async {
    await getData(page).then(
      (response) {
        addData(response);
      },
    );
    notifyListeners();
    // _nayaModel = await getData(page);
    // notifyListeners();
  }

  //to add the list into new page during paginatino
  addData(List nayaModel) {
    _nayaModel.addAll(nayaModel);
    notifyListeners();
    print(nayaModel);
  }
}
