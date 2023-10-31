import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnSelectedOption extends StatelessWidget {
  final String unSelectedtitle;

  const UnSelectedOption({super.key, required this.unSelectedtitle});

  @override
  Widget build(BuildContext context) {
    return Text(unSelectedtitle , style: GoogleFonts.poppins(
      fontSize: 18,
      color: Colors.white,
    ),);
  }
}
