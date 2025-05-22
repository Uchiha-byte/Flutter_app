import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFFE91E63); // Pink
  static const Color secondaryColor = Color(0xFF9C27B0); // Purple
  static const Color accentColor = Color(0xFFEC407A); // Light Pink
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color errorColor = Color(0xFFE74C3C);
  static const Color successColor = Color(0xFF27AE60);
  static const Color textColor = Color(0xFF2C3E50);
  static const Color textLightColor = Color(0xFF7F8C8D);
  static const Color goldColor = Color(0xFFFFD700);
  static const Color silverColor = Color(0xFFC0C0C0);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, secondaryColor],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEC407A), Color(0xFF9C27B0)],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
  );

  static const LinearGradient silverGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFC0C0C0), Color(0xFFA9A9A9)],
  );

  static const LinearGradient diamondGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFB9F2FF), Color(0xFF00BFFF)],
  );

  // Text Styles
  static TextStyle get headingStyle => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
      );

  static TextStyle get subheadingStyle => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textColor,
      );

  static TextStyle get bodyStyle => GoogleFonts.poppins(
        fontSize: 16,
        color: textColor,
      );

  static TextStyle get buttonStyle => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  static TextStyle get premiumStyle => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: goldColor,
      );

  // Input Decoration
  static InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: textLightColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: textLightColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: GoogleFonts.poppins(
          color: textLightColor,
          fontSize: 14,
        ),
      );

  // Button Styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        textStyle: buttonStyle,
      );

  static ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: primaryColor),
        ),
        elevation: 0,
        textStyle: buttonStyle.copyWith(color: primaryColor),
      );

  static ButtonStyle get premiumButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: goldColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        textStyle: buttonStyle,
      );

  // Animations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  
  static Widget fadeTransition(Widget child) {
    return TweenAnimationBuilder<double>(
      duration: defaultAnimationDuration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  static Widget slideTransition(Widget child) {
    return TweenAnimationBuilder<double>(
      duration: defaultAnimationDuration,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 100 * value),
          child: child,
        );
      },
      child: child,
    );
  }

  // Card Styles
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );

  static BoxDecoration get premiumCardDecoration => BoxDecoration(
        gradient: goldGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: goldColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      );

  // Package Card Styles
  static BoxDecoration get packageCardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textLightColor.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );
} 