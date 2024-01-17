part of 'password_bloc.dart';

abstract class PasswordEvent {}

final class PasswordActionEvent extends PasswordEvent {}

final class LengthChangeEvent extends PasswordActionEvent {
  final int value;
  LengthChangeEvent({required this.value});
}

final class ChangeUppercaseEvent extends PasswordActionEvent {
  final bool isChange;
  ChangeUppercaseEvent({required this.isChange});
}

final class ChangeLowercaseEvent extends PasswordActionEvent {
  final bool isChange;
  ChangeLowercaseEvent({required this.isChange});
}

final class ChangeNumberEvent extends PasswordActionEvent {
  final bool isChange;
  ChangeNumberEvent({required this.isChange});
}

final class ChangeSymbolEvent extends PasswordActionEvent {
  final bool isChange;
  ChangeSymbolEvent({required this.isChange});
}

final class GeneratePasswordEvent extends PasswordActionEvent {}

final class TextCopiedEvent extends PasswordActionEvent {}
