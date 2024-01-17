import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgenerator/controller/functions/generate.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial()) {
    on<LengthChangeEvent>(lengthChangeEvent);
    on<ChangeLowercaseEvent>(changeLowercaseEvent);
    on<ChangeUppercaseEvent>(changeUppercaseEvent);
    on<ChangeNumberEvent>(changeNumberEvent);
    on<ChangeSymbolEvent>(changeSymbolEvent);
    on<GeneratePasswordEvent>(generatePasswordEvent);
    on<TextCopiedEvent>(textCopiedEvent);
  }

  FutureOr<void> lengthChangeEvent(
      LengthChangeEvent event, Emitter<PasswordState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('length', event.value);
    emit(LengthChangeState(value: event.value));
  }

  FutureOr<void> changeLowercaseEvent(
      ChangeLowercaseEvent event, Emitter<PasswordState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lowercase', event.isChange);
    emit(ChangeLowercaseState(isChange: event.isChange));
  }

  FutureOr<void> changeUppercaseEvent(
      ChangeUppercaseEvent event, Emitter<PasswordState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('uppercase', event.isChange);
    emit(ChangeUppercaseState(isChange: event.isChange));
  }

  FutureOr<void> changeNumberEvent(
      ChangeNumberEvent event, Emitter<PasswordState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('number', event.isChange);
    emit(ChangeNumberState(isChange: event.isChange));
  }

  FutureOr<void> changeSymbolEvent(
      ChangeSymbolEvent event, Emitter<PasswordState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('symbol', event.isChange);
    emit(ChangeSymbolState(isChange: event.isChange));
  }

  FutureOr<void> generatePasswordEvent(
      GeneratePasswordEvent event, Emitter<PasswordState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int length = prefs.getInt('length') ?? 8;
    final bool includeLowercase = prefs.getBool('lowercase') ?? true;
    final bool includeUppercase = prefs.getBool('uppercase') ?? false;
    final bool includeNumbers = prefs.getBool('number') ?? false;
    final bool includeSymbols = prefs.getBool('symbol') ?? false;
    if (includeSymbols == false &&
        includeUppercase == false &&
        includeLowercase == false &&
        includeNumbers == false) {
      emit(GeneratePasswordErrorState());
    } else {
      final String password = generatePassword(
          length: length,
          includeUppercase: includeUppercase,
          includeNumbers: includeNumbers,
          includeSymbols: includeSymbols,
          includeLowercase: includeLowercase);
      emit(GeneratePasswordState(password: password));
    }
  }

  FutureOr<void> textCopiedEvent(
      TextCopiedEvent event, Emitter<PasswordState> emit) {
    emit(TextCopiedState());
  }
}
