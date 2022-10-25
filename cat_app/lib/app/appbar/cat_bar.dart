import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatBar extends StatelessWidget {
  const CatBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'CatApp demo',
        style: GoogleFonts.poppins(),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
