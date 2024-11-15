import 'package:apiprovder/model/Products.dart';
import 'package:apiprovder/service/apiservice.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{
  List<Products>? plist = [];
  bool isloading=false;
  ApiService apiService=ApiService();

  Future<void> fetch() async {
    changeloading();
    plist= await apiService.fetchproducts()??[];
    notifyListeners();
    changeloading();
  }

  void changeloading() {
    isloading=!isloading;
    notifyListeners();
  }

}
