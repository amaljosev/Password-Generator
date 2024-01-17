import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgenerator/controller/bloc/password_bloc.dart';
import 'package:passwordgenerator/controller/functions/reset.dart';
import 'package:passwordgenerator/view/widgets/field_password.dart';
import 'package:passwordgenerator/view/widgets/header_widget.dart';
import 'package:passwordgenerator/view/widgets/length_widget.dart';
import 'package:passwordgenerator/view/widgets/settings.dart';

int value = 10;

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    reset();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PasswordBloc(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              HeaderWidget(size: size),
              LengthWidget(size: size),
              SettingsWidget(size: size),
              const PasswordField(),
            ],
          ),
        ),
      ),
    );
  }
}
