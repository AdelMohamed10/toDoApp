import 'package:commerce_project/core/cubit/global_cubit.dart';
import 'package:flutter/material.dart';

extension MyTheme on BuildContext {
  ThemeData get getTheme => Theme.of(this);
}

// my_localization_extensions.dart
extension MyLocalization on String {
  String get tr => GlobalCubit.instance.local[this] ?? toUpperCase();
}