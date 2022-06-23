import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaddingText extends StatelessWidget {
  final String texto;

  const PaddingText({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        texto,
        style: GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27),
      ),
    );
  }
}
