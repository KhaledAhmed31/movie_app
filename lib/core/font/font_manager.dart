import 'package:flutter/widgets.dart';

class FontManager {
  FontManager._();

  static const String _montserratFontFamily = 'Montserrat';
  static const String _robotoFontFamily = 'Roboto';
  static const String _poppinsFontFamily = 'Poppins';

  // Montserrat Font
  static TextStyle _montserratGetStyle({
   required double fontSize,
   required Color color ,
   required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: _montserratFontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
static  TextStyle montserratGetRegularStyle({
    required double fontSize,
    required Color color,
  }) {
    return _montserratGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
static  TextStyle montserratGetMediumStyle({
    required double fontSize,
    required Color color,
  }) {
    return _montserratGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
static  TextStyle montserratGetBoldStyle({
    required double fontSize,
    required Color color,
  }) {
    return _montserratGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }
static  TextStyle montserratGetSemiBoldStyle({
    required double fontSize,
    required Color color,
  }) {
    return _montserratGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  // Roboto Font
  static TextStyle _robotoGetStyle({
    required double fontSize,
    required Color color,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: _robotoFontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  } 
  static TextStyle getRobotoRegularStyle({
    required double fontSize,
    required Color color,
  }) {
    return _robotoGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle getRobotoMediumStyle({
    required double fontSize,
    required Color color,
  }) {
    return _robotoGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle getRobotoBoldStyle({
    required double fontSize,
    required Color color,
  }) {
    return _robotoGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

  // Poppins Font
  static TextStyle _poppinsGetStyle({
    required double fontSize,
    required Color color,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: _poppinsFontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
  static TextStyle getPoppinsRegularStyle({
    required double fontSize,
    required Color color,
  }) {
    return _poppinsGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle getPoppinsMediumStyle({
    required double fontSize,
    required Color color,
  }) {
    return _poppinsGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle getPoppinsBoldStyle({
    required double fontSize,
    required Color color,
  }) {
    return _poppinsGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle getPoppinsSemiBoldStyle({
    required double fontSize,
    required Color color,
  }) {
    return _poppinsGetStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }
  

}