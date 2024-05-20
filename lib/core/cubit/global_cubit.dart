import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:commerce_project/core/cubit/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  static final GlobalCubit instance = GlobalCubit();

  GlobalCubit() : super(const GlobalInitial(ThemeMode.light)) {
    loadLanguage();
  }

  Map<String, dynamic> local = {};

  Future<void> loadLanguage() async {
    String s = await rootBundle.loadString('assets/lang/ar.json');
    local = json.decode(s);
    emit(const GlobalInitial(ThemeMode.light));
  }

  void changeMode() {
    final newThemeMode = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(GlobalInitial(newThemeMode));
  }
}

