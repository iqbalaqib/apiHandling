import 'dart:developer';

import 'package:api_handler/http/response.dart';
import 'package:api_handler/registration/resource/registration_api_provider.dart';
import 'package:flutter/cupertino.dart';

class RegistrationRepository {
  Future<DataResponse<dynamic>> registrationApiData() async {
    try {
      RegistrationApiProvider registrationApiProvider =
          RegistrationApiProvider();
      Map<dynamic, dynamic> response =
          await registrationApiProvider.registrationApiData();
      DataResponse dataResponse = DataResponse.processResponse(response);
      if (dataResponse.status == Status.Error) {
        log("DataResponse : ${dataResponse.message}");
      }
      log(" repository ==>   $dataResponse");
      return dataResponse;
    } catch (ex, stack) {
      debugPrintStack(stackTrace: stack, label: ex.toString());
    }
  }
}
