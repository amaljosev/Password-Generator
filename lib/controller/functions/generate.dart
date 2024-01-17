import 'dart:math';

String generatePassword({
  required int length,
  required bool includeUppercase,
  required bool includeNumbers,
  required bool includeSymbols,
  required bool includeLowercase,
}) {
  String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String numberChars = '0123456789';
  String symbolChars = '!@#\$%^&*()-_';
  String allowedChars = '';

  if (includeLowercase) allowedChars += lowercaseChars;
  if (includeUppercase) allowedChars += uppercaseChars;
  if (includeNumbers) allowedChars += numberChars;
  if (includeSymbols) allowedChars += symbolChars;

  Random random = Random();
  List<String> passwordList = List.generate(
      length, (index) => allowedChars[random.nextInt(allowedChars.length)]);

  return passwordList.join();
}

