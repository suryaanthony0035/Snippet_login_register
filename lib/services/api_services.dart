import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:snippet_login_regis_nodejs_api/config.dart';
import 'package:snippet_login_regis_nodejs_api/model/login_requwst_model.dart';
import 'package:snippet_login_regis_nodejs_api/model/login_response_model.dart';
import 'package:snippet_login_regis_nodejs_api/model/register_requwst_model.dart';
import 'package:snippet_login_regis_nodejs_api/model/register_response_model.dart';
import 'package:snippet_login_regis_nodejs_api/services/shared_service.dart';

// class APIServices {
//   static var client = HttpClient();

//   static Future<bool> login(LoginRequestModel model) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };
//     var url = Uri.http(Config.apiURL, Config.loginAPI);

//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    //https://e-commerce-node-deploy.herokuapp.com/api/auth/login

    // var url =
    //     Uri.https("e-commerce-node-deploy.herokuapp.com", "/api/auth/login");

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //SHARED
      await SharedServices.setLoginDetails(loginResponceJson(response.body));
      return true;
    } else {
      return false;
    }
  }

/* surya custom code */

  static Future<RegisterResponceModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    //https://e-commerce-node-deploy.herokuapp.com/api/auth/login

    // var url =
    //     Uri.https("e-commerce-node-deploy.herokuapp.com", "/api/auth/login");

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponceModel(response.body);
  }

// /* snippet github code  */
//   static Future<RegisterResponceModel> register(
//     RegisterRequestModel model,
//   ) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };

//     var url = Uri.http(
//       Config.apiURL,
//       Config.registerAPI,
//     );

//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );

//     return registerResponceModel(
//       response.body,
//     );
//   }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedServices.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Basic ${loginDetails!.payload.AcessToken}'
      'Authorization': 'Basic ${loginDetails!.payload.AcessToken}'
    };

    //https://e-commerce-node-deploy.herokuapp.com/api/auth/login

    // var url =
    //     Uri.https("e-commerce-node-deploy.herokuapp.com", "/api/auth/login");

    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      //SHARED
      return response.body;
    } else {
      return "";
    }
  }
}
