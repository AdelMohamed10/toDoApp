import 'package:commerce_project/auth/new_password/controller/cubit/new_password_cubit.dart';
import 'package:commerce_project/auth/new_password/view/component/new_password_bottom_widget.dart';
import 'package:commerce_project/auth/new_password/view/component/required_auth_pass_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<NewPasswordCubit>(
        create: (context) => NewPasswordCubit(),
        child: BlocBuilder<NewPasswordCubit, NewPasswordState>(
          builder: (context, state) {
            final NewPasswordCubit controller = context.read<NewPasswordCubit>();
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RequiredAuthPassWidget(controller: controller),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 10.0), // Adjusted padding
                child: NewPasswordBottomNav(controller: controller),
              ),
            );
          },
        ),
      ),
    );
  }
}
