import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:commerce_project/dashboard/modules/task/model/repo/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final DatabaseRepo repo = DatabaseRepo();

  RegistrationCubit() : super(RegistrationInitial());

      TextEditingController firstNameController = TextEditingController();
      TextEditingController lastNameController = TextEditingController();
      TextEditingController mailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();

      GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void onPressedConfirmButton(BuildContext context) {
  if (formKey.currentState != null) {
    log("Form fields: ${firstNameController.text}, ${lastNameController.text}, ${mailController.text}, ${passwordController.text}");
    if (formKey.currentState!.validate()) {
      log("Form is valid");
      Navigator.pushNamed(context, 'login');
    } else {
      log("Form is invalid");
    }
  } else {
    log("Form key is null");
  }
}
  Future<void> insertUserIntoDatabase() async {
    try {
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String email = mailController.text;
      String password = passwordController.text;

      await repo.insertUserData(firstName, lastName, email, password);

      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationError(errorMessage: 'Failed to register: $e'));

    }
  }
}