import 'package:commerce_project/auth/forgot/viewPage/forgot_page/forgot_main_page.dart';
import 'package:commerce_project/auth/login/viewPage/login_page/login_main_page.dart';
import 'package:commerce_project/auth/new_password/view/new_password_page/new_password_main_page.dart';
import 'package:commerce_project/auth/onboarding/view/page/onboarding_page.dart';
import 'package:commerce_project/auth/registration/view/page/registration-page.dart';
import 'package:commerce_project/auth/verification/view/page/verification_page.dart';
import 'package:commerce_project/dashboard/modules/new_task/view/page/new_task_page.dart';
import 'package:commerce_project/dashboard/view/page/dashboard_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const RegistrationPage()),
  ];

  static Route<dynamic>? onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'registration':
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'forgot':
        return MaterialPageRoute(builder: (_) => const ForgotPage());
      case 'verify':
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      case 'newpassword':
        return MaterialPageRoute(builder: (_) => const NewPasswordPage());
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_task':
        return MaterialPageRoute(builder: (_) => const NewTaskPage());
      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
    }
  }
}
