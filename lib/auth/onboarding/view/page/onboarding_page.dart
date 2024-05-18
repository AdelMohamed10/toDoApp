// import 'dart:js';

import 'package:commerce_project/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:commerce_project/auth/onboarding/view/component/onboarding_body.dart';
import 'package:commerce_project/auth/onboarding/view/component/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingControllerCubit>(
        create: (context) => OnboardingControllerCubit(),
        child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
          builder: (context, state) {
            OnboardingControllerCubit controller=context.read<OnboardingControllerCubit>();
            return Scaffold(
              body:OnBoardingBody(controller: controller,),
              bottomNavigationBar:OnboardingButtonWidget(controller: controller,),
            );
          },
        ),
      ),
    );      
  }
}
