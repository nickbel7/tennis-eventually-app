import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

@immutable 
class AppColors {
  // Color constructor -> (0x Opacity R G B) in hex values
  final totallyBlack = const Color(0xFF001112); // #001112
  final totallyWhite = const Color(0xFFFFFFFF); // #FFFFFF
  final amazonGreen = const Color(0xFF226634);  // #226634
  final greenGoblin = const Color(0xFF22AA67);  // #22AA67
  final grassGreen = const Color(0xFF77BB78);   // #77BB78
  final tennisBall = const Color(0xFFDFFF4F);   // #DFFF4F
  final sandStorm = const Color(0xFFE4DFB4);    // #E4DFB4

  const AppColors();
}
