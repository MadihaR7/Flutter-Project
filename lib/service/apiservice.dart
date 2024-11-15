import 'dart:convert';

import 'package:apiprovder/model/Products.dart';
import 'package:apiprovder/model/RespProducts.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final baseurl="https://dummyjson.com";
  Future<List<Products>?> fetchproducts() async {
    final response=await http.get(Uri.parse("$baseurl/products"),headers: null);
    var jsonn=jsonDecode(response.body);
    if(response.statusCode >= 200 && response.statusCode <=299) {
      RespProducts resp=RespProducts.fromJson(jsonn);
      var plist=resp.products;
      return plist;
    }
  }
}