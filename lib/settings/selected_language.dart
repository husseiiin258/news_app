import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedOption extends StatelessWidget {
  final String selectedTitle;

  const SelectedOption({super.key, required this.selectedTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white24,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(selectedTitle  , style: GoogleFonts.poppins(
          fontSize: 22 ,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),), Icon(Icons.check)],
      ),
    );
  }
}