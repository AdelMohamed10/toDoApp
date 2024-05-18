import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

      TextEditingController mailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();

      GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void onPressedConfirmButton(BuildContext context) {
  if (formKey.currentState != null) {
    print("Form fields: ${mailController.text}, ${passwordController.text}");
    if (formKey.currentState!.validate()) {
      print("Form is valid");
      Navigator.pushNamed(context, 'dashboard');
    } else {
      print("Form is invalid");
    }
  } else {
    print("Form key is null");
  }
}


}