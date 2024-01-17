part of 'password_bloc.dart';

abstract class PasswordState {}

final class PasswordInitial extends PasswordState {}

final class PasswordActionState extends PasswordState {}

final class LengthChangeState extends PasswordActionState {
  final int value;
  LengthChangeState({required this.value});
}

final class ChangeUppercaseState extends PasswordActionState {
  final bool isChange;
  ChangeUppercaseState({required this.isChange});
}

final class ChangeLowercaseState extends PasswordActionState {
  final bool isChange;
  ChangeLowercaseState({required this.isChange});
}

final class ChangeNumberState extends PasswordActionState {
  final bool isChange;
  ChangeNumberState({required this.isChange});
}

final class ChangeSymbolState extends PasswordActionState {
  final bool isChange;
  ChangeSymbolState({required this.isChange});
}

final class GeneratePasswordState extends PasswordActionState {
  final String password;
  GeneratePasswordState({required this.password});
}
final class GeneratePasswordErrorState extends PasswordActionState{} 

final class TextCopiedState extends PasswordActionState{} 
