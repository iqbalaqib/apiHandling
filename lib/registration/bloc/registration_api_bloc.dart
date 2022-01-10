import 'dart:async';
import 'dart:developer';

import 'package:api_handler/http/response.dart';
import 'package:api_handler/registration/resource/registration_repository.dart';
import 'package:bloc/bloc.dart';
import 'index.dart';

class RegistrationApiBloc
    extends Bloc<RegistrationApiEvent, RegistrationApiState> {
  RegistrationApiBloc() : super(RegistrationApiInitial());

  Stream<RegistrationApiState> mapEventToState(
      RegistrationApiEvent event) async* {
    if (event is RegistrationApiButtonPressed) {
      yield* mapRegistrationApiButtonPressedToState(event);
    }
  }

  Stream<RegistrationApiState> mapRegistrationApiButtonPressedToState(
      RegistrationApiButtonPressed event) async* {
    yield RegistrationApiInitial();
    RegistrationRepository registrationRepository = RegistrationRepository();
    DataResponse response = await registrationRepository.registrationApiData();
    log("response of api in bloc --> ${response.data}");
  }
}
