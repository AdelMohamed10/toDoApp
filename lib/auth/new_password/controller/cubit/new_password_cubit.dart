import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());

      TextEditingController passwordController = TextEditingController();
      TextEditingController confirmPasswordController = TextEditingController();

      GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void onPressedConfirmButton(BuildContext context) {
  if (formKey.currentState != null) {
    log("Form fields: ${passwordController.text}");
    if (formKey.currentState!.validate()) {
      log("Form is valid\n Password has reset");
      Navigator.pushNamed(context, 'login');
    } else {
      log("Form is invalid");
    }
  } else {
    log("Form key is null");
  }
}


}