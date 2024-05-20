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
              "Login Page",
              style: TextStyle(
                fontSize: 25 * scaleFactor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            buildTextFormField(
              context,
              controller: widget.controller.mailController,
              labelText: 'Email',
              icon: Icons.mail,
              validator: MyValidation().emailValidate,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(BuildContext context,
      {required TextEditingController controller,
      required String labelText,
      required IconData icon,
      required String? Function(String?)? validator}) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.name,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
