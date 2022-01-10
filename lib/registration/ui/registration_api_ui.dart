import 'package:api_handler/registration/bloc/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationApiUi extends StatefulWidget {
  @override
  _RegistrationApiUiState createState() => _RegistrationApiUiState();
}

class _RegistrationApiUiState extends State<RegistrationApiUi> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationApiBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
        ),
        body: BlocBuilder<RegistrationApiBloc, RegistrationApiState>(
          builder: (context, state) {
            return Container(
              child: Center(
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<RegistrationApiBloc>(context)
                      ..add(RegistrationApiButtonPressed());
                  },
                  child: Text("Registration"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
