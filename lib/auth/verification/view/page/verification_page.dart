import 'package:commerce_project/auth/verification/controller/cubit/verification_cubit.dart';
import 'package:commerce_project/core/utiless/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final VerificationCubit controller = context.read<VerificationCubit>();
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Enter your code",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    PinCodeTextField(
                      appContext: context,
                      length: 5,
                      obscureText: true,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: MyValidation().verificationValidate,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      textStyle: const TextStyle(fontSize: 20, height: 1.6),
                      backgroundColor: Colors.blue.shade50,
                      enableActiveFill: true,
                      controller: controller.pinCodeController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (value) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.onTapConfirm(context);
                      },
                      icon: const Icon(Icons.done, color: Colors.white),
                      label: const Text("Verify"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Colors.green, // Text and icon color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text("No messages received?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'verify');
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
                          ),
                          child: const Text("Resend"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
