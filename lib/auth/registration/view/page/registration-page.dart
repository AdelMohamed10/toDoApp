import 'package:commerce_project/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:commerce_project/auth/registration/view/component/bottom_widget.dart';
import 'package:commerce_project/auth/registration/view/component/required-data-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final RegistrationCubit controller = context.read<RegistrationCubit>();
            return Scaffold(
              body: RequiredDataWidget(
                controller: controller,
              ),

              bottomNavigationBar: SizedBox(height: 100, child: BottomNav(
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
