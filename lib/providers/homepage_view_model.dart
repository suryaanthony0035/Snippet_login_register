import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../model/fruit_products/fruit_products.dart';
import '../model/fruit_products/payload.dart';
import '../model/get_product_img/get_product_img.dart';
import '../model/get_product_img/payload.dart';
import '../model/get_products/get_products.dart';
import '../model/get_products/payload.dart';
import '../services/shared_service.dart';

class GetProduct extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => this._isLoading;
  set isLoading(bool value) => this._isLoading = value;

  // List<ImgPayload> _imgPayload = List.empty(growable: true);
  // List<ImgPayload> get imgPayload => this._imgPayload;
  // set imgPayload(List<ImgPayload> value) => this._imgPayload = value;

  List<FruitPayload> _fruitPayload = List.empty(growable: true);
  List<FruitPayload> get fruitPayload => this._fruitPayload;
  set fruitPayload(List<FruitPayload> value) => this._fruitPayload = value;

  // List<ProductPayload> _productPayload = List.empty(growable: true);
  // List<ProductPayload> get productPayload => this._productPayload;
  // set productPayload(List<ProductPayload> value) =>
  //     this._productPayload = value;

  static var client = http.Client();
  SharedServices sharedServices = SharedServices();

  getproducts() async {
    _isLoading = true;
    notifyListeners();
    // var accessToken = await sharedServices.loginDetails();
    Map<String, String> requestHeaders = {
      // HttpHeaders.authorizationHeader:
      //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyODM1MzliZDFjNTljMjU2ZmI0YmU1ZCIsInJvbGUiOiJBZG1pbiIsImlhdCI6MTY1Mjc3NDYyNywiZXhwIjoxNjU1MzY2NjI3fQ.YiVAsaELWV8tKDlxTd12t6n2ZQnaPkaU8PgmzydILMo',
      'Content-Type': 'application/json'
    };

    var url = Uri.http(Config.apiURL, Config.getProduct);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      //SHARED
      print("product");
      var decodejson = _decodeResponce(response);

      var body = FruitProducts.fromJson(decodejson);
      _fruitPayload = body.payload ?? [];
      print(decodejson);
      // await sharedServices.setLoginDetails(loginResponceJson(response.body));

    } else {}

    // var urlImag = Uri.http(Config.apiURL, Config.getImageUrl);

    // var imgresponse = await client.get(
    //   url,
    //   headers: requestHeaders,
    // );

    // if (imgresponse.statusCode == 200) {
    //   //SHARED
    //   var decodejson = _decodeResponce(imgresponse);
    //   var body = GetProductImg.fromJson(decodejson);
    //   _imgPayload = body.payload ?? [];
    //   // await sharedServices.setLoginDetails(loginResponceJson(response.body));
    //   notifyListeners();
    //   return true;
    // } else {
    //   // return false;
    // }
    _isLoading = false;
    notifyListeners();
  }

  _decodeResponce(http.Response res) {
    try {
      var decodeJson = jsonDecode(res.body);
      return decodeJson;
    } catch (e) {
      print(e);
    }
  }
}
