import 'package:commerce_project/auth/new_password/controller/cubit/new_password_cubit.dart';
import 'package:commerce_project/core/utiless/validation.dart';
import 'package:flutter/material.dart';

class RequiredAuthPassWidget extends StatefulWidget {
  final NewPasswordCubit controller;

  RequiredAuthPassWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _RequiredAuthPassWidgetState createState() => _RequiredAuthPassWidgetState();
}

class _RequiredAuthPassWidgetState extends State<RequiredAuthPassWidget> {
  bool _passwordVisible = false; // Initially, password is hidden

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor;

    return Form(
      key: widget.controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Welcome to ToDoList App",
              style: TextStyle(
                fontSize: 35 * scaleFactor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Enter your new password",
              style: TextStyle(
                fontSize: 25 * scaleFactor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            TextFormField(
              obscureText: !_passwordVisible, // Show/hide password based on _passwordVisible
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller.passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: MyValidation().passwordValidate,
              decoration: InputDecoration(
                labelText: 'New Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey, // Customize the icon color
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible; // Toggle visibility
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, // Use your primary color
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red, // Use your error color
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Reduced space here
            TextFormField(
              obscureText: !_passwordVisible, // Show/hide password based on _passwordVisible
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value != widget.controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey, // Customize the icon color
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible; // Toggle visibility
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, // Use your primary color
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red, // Use your error color
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Adjusted space
          ],
        ),
      ),
    );
  }
}
