import 'package:commerce_project/auth/forgot/controller/cubit/forgot_cubit.dart';
import 'package:commerce_project/auth/forgot/viewPage/components/forgot_bottom_page.dart';
import 'package:commerce_project/auth/forgot/viewPage/components/requred_auth_forgot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ForgotCubit>(
        create: (context) => ForgotCubit(),
        child: BlocBuilder<ForgotCubit, ForgotState>(
          builder: (context, state) {
            final ForgotCubit controller = context.read<ForgotCubit>();
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RequiredAuthForgotaWidget(controller: controller),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Spacer
                  ],
                ),
              ),
              bottomNavigationBar: ForgotBottomNav(controller: controller),
            );
          },
        ),
      ),
    );
  }
}
