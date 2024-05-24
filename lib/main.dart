import 'package:commerce_project/auth/onboarding/view/page/onboarding_page.dart';
import 'package:commerce_project/auth/registration/view/page/registration-page.dart';
import 'package:commerce_project/core/cubit/global_cubit.dart';
import 'package:commerce_project/core/cubit/global_state.dart';
import 'package:commerce_project/core/routing/my_route.dart';
import 'package:commerce_project/core/my_theme.dart' as my_theme;
import 'package:commerce_project/dashboard/modules/task/controller/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

  // Determine which page to show based on the onboarding status
  Widget initialPage = onBoarding ? const RegistrationPage() : const OnBoardingPage();
  runApp(MyApp(initialPage: initialPage));
}

class MyApp extends StatelessWidget {
  final Widget initialPage;

  const MyApp({Key? key, required this.initialPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit.instance,
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.light; // Default theme mode

          if (state is GlobalInitial) {
            themeMode = state.themeMode;
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: my_theme.MyTheme.instance.light,
            darkTheme: my_theme.MyTheme.instance.dark,
            home: Builder(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('ToDoList'),
                  actions: [
                    IconButton(
                      icon: Icon(themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
                      onPressed: () {
                        GlobalCubit.instance.changeMode();
                      },
                    ),
                  ],
                ),
                body: initialPage,
              ),
            ),
            onGenerateRoute: MyRoute.onNavigateByName,
          );
        },
      ),
    );
  }
}
