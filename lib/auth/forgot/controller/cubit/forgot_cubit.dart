import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'forgot_state.dart';

class ForgotCubit extends Cubit<ForgotState> {
  ForgotCubit() : super(ForgotInitial());

      TextEditingController mailController = TextEditingController();

      GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void onPressedConfirmButton(BuildContext context) {
  if (formKey.currentState != null) {
    print("Form fields: ${mailController.text}");
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