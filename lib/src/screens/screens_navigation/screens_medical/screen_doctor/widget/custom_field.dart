import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  final String label;
  TextEditingController textController = TextEditingController();

  CustomField(
      {super.key,
      required this.label,
      required this.textController,
      required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.getFont(
          'Poppins',
          decoration: TextDecoration.none,
        ),
        
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}