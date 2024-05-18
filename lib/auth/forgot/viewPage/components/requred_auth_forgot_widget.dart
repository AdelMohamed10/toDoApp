import 'package:commerce_project/auth/forgot/controller/cubit/forgot_cubit.dart';
import 'package:commerce_project/core/utiless/validation.dart';
import 'package:flutter/material.dart';

class RequiredAuthForgotaWidget extends StatelessWidget {
  final ForgotCubit controller;

  RequiredAuthForgotaWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        // Spacer(flex: 1,),

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
        SizedBox(height: 120,),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Type your email here",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // Spacer(flex: 1,),
        SizedBox(height: 40,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.mailController,
            keyboardType: TextInputType.name,
            validator: MyValidation().emailValidate,
            decoration: InputDecoration(
              label: const Text('mail'),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "example@gmail.com",
              prefixIcon: const Icon(Icons.mail),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 63, 51, 114),
                  width: 2
                ),
                borderRadius: BorderRadius.circular(30)
              ),
      
                
              
                focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 164, 57),
                  width: 2
                ),
                borderRadius: BorderRadius.circular(30)
              ),
                errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 213, 30, 30),
                  width: 2
                ),
      
                
                borderRadius: BorderRadius.circular(30)
              )
            ),
              
          ),
          const SizedBox(
            height: 50,
          ),
        
        ],
      
      ),
    );
  }
// ),
// ),
// );
}