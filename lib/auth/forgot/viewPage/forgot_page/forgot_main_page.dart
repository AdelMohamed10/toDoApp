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
              body: RequiredAuthForgotaWidget(
                controller: controller,
              ),

              bottomNavigationBar: SizedBox(height: 100, child: ForgotBottomNav(
                controller: controller,
              ),
              ),
            );
          },
        ),
      ),
    );
  }
}