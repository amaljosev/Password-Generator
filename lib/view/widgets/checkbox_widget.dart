import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgenerator/controller/bloc/password_bloc.dart';
import 'package:passwordgenerator/view/core/constants.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget(
      {super.key,
      required this.size,
      required this.value,
      required this.label});
  final Size size;
  final bool value;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (label == 'Uppercase') {
          context
              .read<PasswordBloc>()
              .add(ChangeUppercaseEvent(isChange: !value));
        } else if (label == 'lowercase') {
          context
              .read<PasswordBloc>()
              .add(ChangeLowercaseEvent(isChange: !value));
        } else if (label == 'Numbers') {
          context.read<PasswordBloc>().add(ChangeNumberEvent(isChange: !value));
        } else if (label == 'Symbols') {
          context.read<PasswordBloc>().add(ChangeSymbolEvent(isChange: !value));
        }
      },
      child: Container(
        height: size.height * 0.070, 
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Icon(value ? Icons.check_box : Icons.check_box_outline_blank),
          ),
          Text(label),
        ]),
      ),
    );
  }
}
