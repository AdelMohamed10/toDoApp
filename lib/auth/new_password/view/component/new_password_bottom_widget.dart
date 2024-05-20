import 'package:commerce_project/auth/new_password/controller/cubit/new_password_cubit.dart';
import 'package:flutter/material.dart';

class NewPasswordBottomNav extends StatelessWidget {
  final NewPasswordCubit controller;
  NewPasswordBottomNav({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            controller.onPressedConfirmButton(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          child: const Text("Reset"),
        ),
      ],
    );
  }
}
