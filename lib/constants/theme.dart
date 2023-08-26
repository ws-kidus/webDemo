
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final whiteTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.openSans().fontFamily,
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS:FadeUpwardsPageTransitionsBuilder(),
      }),
  );
}