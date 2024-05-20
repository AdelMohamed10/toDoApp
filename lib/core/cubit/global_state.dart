import 'package:flutter/material.dart';

@immutable
abstract class GlobalState {
  final ThemeMode themeMode;

  const GlobalState(this.themeMode);
}

class GlobalInitial extends GlobalState {
  const GlobalInitial(ThemeMode themeMode) : super(themeMode);
}
