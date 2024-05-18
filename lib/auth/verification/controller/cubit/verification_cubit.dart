import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  TextEditingController pinCodeController = TextEditingController();

  final String validateCode = "55555";

    void onTapConfirm(BuildContext context) {
  if (pinCodeController.text != null) {
    log("Form fields: ${pinCodeController.text}");
    if (pinCodeController.text == validateCode) {
      log("Form is valid");
      Navigator.pushNamed(context, 'newpassword');
    } else {
      log("Form is invalid");
    }
  } else {
    log("Form key is null");
  }
}
}