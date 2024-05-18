import 'package:commerce_project/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNav extends StatelessWidget {
  final RegistrationCubit controller;

  BottomNav({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          onPressed: () {
            print("Confirm button pressed");
            controller.onPressedConfirmButton(context);
          },
          child: const Text("Confirm"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Have an account?"),
            TextButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.pushNamed(context, 'login');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      ],
    );
  }
}
