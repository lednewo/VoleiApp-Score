import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placar_volei/src/util/color/app_colors.dart';

class PlacarWidget extends StatelessWidget {
  final String text;
  final AlignmentGeometry alignment;
  final Color? color;

  const PlacarWidget({
    required this.text,
    required this.alignment,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: alignment,
        heightFactor: 0.5,
        child: Container(
          width: 210,
          height: 250,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.righteous(
                color: AppColors().colorText,
                fontSize: 160,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
