import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

@immutable 
class AppColors {
  // Color constructor -> (0x Opacity R G B) in hex values
  final Color totallyBlack = const Color(0xFF001112); // #001112
  final Color totallyWhite = const Color(0xFFFFFFFF); // #FFFFFF
  final Color amazonGreen = const Color(0xFF226634);  // #226634
  final Color greenGoblin = const Color(0xFF22AA67);  // #22AA67
  final Color grassGreen = const Color(0xFF77BB78);   // #77BB78
  final Color tennisBall = const Color(0xFFDFFF4F);   // #DFFF4F
  final Color sandStorm = const Color(0xFFE4DFB4);    // #E4DFB4
  final Color backdrop = const Color(0xFFF0F0E2);

  const AppColors();
}
