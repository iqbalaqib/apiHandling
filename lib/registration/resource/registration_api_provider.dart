import 'dart:convert';
import 'dart:developer';

import 'package:api_handler/http/api_provider.dart';
import 'package:flutter/cupertino.dart';

class RegistrationApiProvider {
  static String _apiEndPoint = "https://demo-ipg.ctdev.comtrust.ae:2443";

  Future<Map<dynamic, dynamic>> registrationApiData() async {
    try {
      ApiProvider apiProvider = ApiProvider();
      ;
      String body = json.encode({
        "Registration": {
          "Currency": "AED",
          "ReturnPath": "https://localhost/callbackURL",
          "TransactionHint": "CPT:Y;VCC:Y;",
          "OrderID": "7210055701315195",
          "Store": "0000",
          "Terminal": "0000",
          "Channel": "Web",
          "Amount": "2.00",
          "Customer": "Demo Merchant",
          "OrderName": "Paybill",
          "UserName": "Demo_fY9c",
          "Password": "Comtrust@20182018"
        }
      });
      Map<dynamic, dynamic> response =
          await apiProvider.post("$_apiEndPoint", body);
      log("api Provider$response");
      return response;
    } catch (ex, stack) {
      debugPrintStack(stackTrace: stack, label: ex.toString());
      throw Exception;
    }
  }
}
