import 'package:commerce_project/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';

class LoginBottomNav extends StatelessWidget {
  final LoginCubit controller;

  LoginBottomNav({Key? key, required this.controller}) : super(key: key);

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
          child: const Text("Login"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot Password?"),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'forgot');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
              ),
              child: const Text("Change Password"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
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
