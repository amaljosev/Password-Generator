import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgenerator/controller/bloc/password_bloc.dart';
import 'package:passwordgenerator/view/core/constants.dart';

class LengthWidget extends StatelessWidget {
  const LengthWidget({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    int value = 8;
    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is LengthChangeState) {
          value = state.value;
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: size.height * 0.1,
          width: size.width * 0.1,
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: value.toDouble(),
                    max: 20,
                    min: 8,
                    onChanged: (value) => context
                        .read<PasswordBloc>()
                        .add(LengthChangeEvent(value: value.toInt().floor())),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(child: Text("$value")),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
