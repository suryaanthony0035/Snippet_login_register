import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:snippet_login_regis_nodejs_api/config.dart';
import 'package:snippet_login_regis_nodejs_api/model/login_requwst_model.dart';
import 'package:snippet_login_regis_nodejs_api/model/login_response_model.dart';
import 'package:snippet_login_regis_nodejs_api/model/register_requwst_model.dart';
import 'package:snippet_login_regis_nodejs_api/model/register_response_model.dart';
import 'package:snippet_login_regis_nodejs_api/services/shared_service.dart';
import 'package:provider/provider.dart';

class APIService extends ChangeNotifier {
  static var client = http.Client();
  SharedServices sharedServices = SharedServices();

  Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //SHARED
      await sharedServices.setLoginDetails(loginResponceJson(response.body));
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

/* surya custom code */

  Future<RegisterResponceModel> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    notifyListeners();
    return registerResponceModel(response.body);
  }

  Future<String> getUserProfile() async {
    var loginDetails = await sharedServices.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Basic ${loginDetails!.payload.AcessToken}'
      'Authorization': 'Basic ${loginDetails!.payload.AcessToken}'
    };

    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      notifyListeners();
      //SHARED
      return response.body;
    } else {
      return "";
    }
  }
}
