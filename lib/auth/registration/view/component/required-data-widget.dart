import 'package:commerce_project/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:commerce_project/core/utiless/validation.dart';
import 'package:flutter/material.dart';

class RequiredDataWidget extends StatefulWidget {
  final RegistrationCubit controller;

  RequiredDataWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _RequiredDataWidgetState createState() => _RequiredDataWidgetState();
}

class _RequiredDataWidgetState extends State<RequiredDataWidget> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    final ThemeData theme = Theme.of(context);
    final bool isLightMode = theme.brightness == Brightness.light;

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
                color: isLightMode ? Colors.black : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Sign up Page",
              style: TextStyle(
                fontSize: 25 * scaleFactor,
                fontWeight: FontWeight.bold,
                color: isLightMode ? Colors.black : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            buildTextFormField(
              context,
              controller: widget.controller.firstNameController,
              labelText: 'First Name',
              icon: Icons.person,
              validator: MyValidation().nameValidate,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            buildTextFormField(
              context,
              controller: widget.controller.lastNameController,
              labelText: 'Last Name',
              icon: Icons.person,
              validator: MyValidation().nameValidate,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            buildTextFormField(
              context,
              controller: widget.controller.mailController,
              labelText: 'Email',
              icon: Icons.mail,
              validator: MyValidation().emailValidate,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              obscureText: !_passwordVisible,
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
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
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
