// import 'dart:ffi';
// import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:commerce_project/auth/onboarding/model/onboarding_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }
  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    await sharedPreferences.setBool('onboarding', true);

    // Navigator.push(
    //   context as BuildContext, 
    //   MaterialPageRoute<void>(builder: (BuildContext context) => const RegistrationPage(),),);
    
    Navigator.pushNamed(context, 'registration');
  
  }


    List data = [
  OnboardingModel(
    image: 'images/First.jpeg',
    title: 'Task',
    suptitle: 'Write your task by pressing on plus sign',
    color: Colors.green,
  ),
  OnboardingModel(
    image: 'images/Second.jpeg',
    title: 'Done',
    suptitle: 'You can find your completed tasks easely in done page',
    color: Colors.blue,
  ),
  OnboardingModel(
    image: 'images/Third.jpeg',
    title: 'Missed',
    suptitle: 'Know tasks which are uncompleted in missed page',
    color: Colors.red,
  ),
  OnboardingModel(
    image: 'images/Third.jpeg',
    title: 'Pinned',
    suptitle: 'You can pin your fixed tasks in pinned page',
    color: Colors.red,
  ),
];

}
