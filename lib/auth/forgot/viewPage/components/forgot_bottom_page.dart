import 'package:commerce_project/auth/forgot/controller/cubit/forgot_cubit.dart';
import 'package:flutter/material.dart';

class ForgotBottomNav extends StatelessWidget {
  final ForgotCubit controller;
  ForgotBottomNav({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'verify');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          child: const Text("Submit"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Return to sign in page?"),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
              ),
              child: const Text("Sign In"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Create a new account?"),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.pushNamed(context, 'registration');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
              ),
              child: const Text("Create an account"),
            ),
          ],
        )
      ],
    );
  }
}
