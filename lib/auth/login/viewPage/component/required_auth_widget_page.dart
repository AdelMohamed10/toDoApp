import 'package:commerce_project/auth/login/controller/cubit/login_cubit.dart';
import 'package:commerce_project/core/utiless/validation.dart';
import 'package:flutter/material.dart';

class RequiredAuthDataWidget extends StatefulWidget {
  final LoginCubit controller;

  RequiredAuthDataWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _RequiredAuthDataWidgetState createState() => _RequiredAuthDataWidgetState();
}

class _RequiredAuthDataWidgetState extends State<RequiredAuthDataWidget> {
  bool _passwordVisible = false; // Initially, password is hidden

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to ToDoList App",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 120),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Page",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller.mailController,
            keyboardType: TextInputType.emailAddress,
            validator: MyValidation().emailValidate,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.mail),
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
          const SizedBox(height: 20),
          TextFormField(
            obscureText: !_passwordVisible, // Show/hide password based on _passwordVisible
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller.passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: MyValidation().passwordValidate,
            decoration: InputDecoration(
              labelText: 'Password',
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
        ],
      ),
    );
  }
}
