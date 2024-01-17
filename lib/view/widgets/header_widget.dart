import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.1,
      child: Center(
          child: Text('Password Generator',
              style: GoogleFonts.wallpoet(fontSize: size.width * 0.060))),
    );
  }
}
