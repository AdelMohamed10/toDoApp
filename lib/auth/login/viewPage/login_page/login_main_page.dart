import 'package:commerce_project/auth/login/controller/cubit/login_cubit.dart';
import 'package:commerce_project/auth/login/viewPage/component/login_bottom_page.dart';
import 'package:commerce_project/auth/login/viewPage/component/required_auth_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final LoginCubit controller = context.read<LoginCubit>();
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RequiredAuthDataWidget(controller: controller),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Spacer
                  ],
                ),
              ),
              bottomNavigationBar: LoginBottomNav(controller: controller),
            );
          },
        ),
      ),
    );
  }
}
