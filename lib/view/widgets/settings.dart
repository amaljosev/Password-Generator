import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordgenerator/controller/bloc/password_bloc.dart';
import 'package:passwordgenerator/view/widgets/checkbox_widget.dart';

bool isUpper = false;
bool isLower = true;
bool isNum = false;
bool isSymbol = false;

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is ChangeUppercaseState) {
          isUpper = state.isChange;
        }
        if (state is ChangeLowercaseState) {
          isLower = state.isChange;
        }
        if (state is ChangeNumberState) {
          isNum = state.isChange;
        }
        if (state is ChangeSymbolState) {
          isSymbol = state.isChange;
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: size.height * 0.5,
          width: size.width * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'settings',
                  style: GoogleFonts.arima(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              CheckboxWidget(size: size, value: isUpper, label: 'Uppercase'),
              CheckboxWidget(size: size, value: isLower, label: 'lowercase'),
              CheckboxWidget(size: size, value: isNum, label: 'Numbers'),
              CheckboxWidget(size: size, value: isSymbol, label: 'Symbols'),
            ],
          ),
        );
      },
    );
  }
}
