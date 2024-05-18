import 'package:commerce_project/auth/onboarding/view/page/onboarding_page.dart';
import 'package:commerce_project/auth/registration/view/page/registration-page.dart';
import 'package:commerce_project/core/routing/my_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

  // Determine which page to show based on the onboarding status
  Widget initialPage = onBoarding ? const RegistrationPage() : const OnBoardingPage();
  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: DashboardPage(),
    onGenerateInitialRoutes: (_) => [MaterialPageRoute(builder: (_) => initialPage)],
    onGenerateRoute: MyRoute.onNavigateByName,
  );
  runApp(materialApp);
}
