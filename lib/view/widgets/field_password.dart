import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgenerator/controller/bloc/password_bloc.dart';
import 'package:passwordgenerator/view/core/constants.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();

    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is GeneratePasswordState) {
          passwordController.text = state.password;
        }
        if (state is GeneratePasswordErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Select any type'),
            behavior: SnackBarBehavior.floating,
            padding: EdgeInsets.all(10),
          ));
        }
        if (state is TextCopiedState) {
          if (passwordController.text == '') return;
          Clipboard.setData(ClipboardData(text: passwordController.text));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                readOnly: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: secondaryColor,
                  suffixIcon: const Icon(Icons.copy),
                ),
                onTap: () =>
                    context.read<PasswordBloc>().add(TextCopiedEvent()),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () =>
                    context.read<PasswordBloc>().add(GeneratePasswordEvent()),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text('Generate'))
          ],
        );
      },
    );
  }
}
