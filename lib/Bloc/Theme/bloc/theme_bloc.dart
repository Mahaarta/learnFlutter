import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeState _themeData = ThemeState(ThemeData());

  ThemeBloc() : super(ThemeState(ThemeData())) {
    on<ThemeEvent>((event, emit) {
      if (event is ChangeTheme) {
        _themeData = ThemeState(event.themeData);
        emit(_themeData);
      }
    });
  }
}
