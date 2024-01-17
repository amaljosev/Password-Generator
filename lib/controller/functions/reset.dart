import 'package:shared_preferences/shared_preferences.dart';

Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    await prefs.setBool('lowercase', true);
    await prefs.setBool('uppercase', false);
    await prefs.setBool('number', false);
    await prefs.setBool('symbol', false);
    await prefs.setInt('length', 8);
  }