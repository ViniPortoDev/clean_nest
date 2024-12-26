// ignore_for_file: unused_element

part of 'themes.dart';

class _CnThemeColors {
  static const Color cnGreen = Color(0xff9BD900);
  static const Color cnYellow = Color(0xffFFF2D1);
  static const Color cnCyan = Color(0xff16C1F5);
  static const Color cnCyanLight = Color(0xffDCF7FF);
  static const Color cnDarkBlue = Color(0xff123382);
  static const Color cnLightBlue = Color(0xffCFDAF0);
  static const Color cnPurple = Color(0xff6531BD);
  static const Color cnDarkPurple = Color(0xff32185E);
  static const Color cnPink = Color(0xffF660A3);
  static const Color cnRed = Color(0xffFF3C3C);
  static const Color cnDarkRed = Color(0xffCC1100);
  static const Color cnLightRed = Color.fromARGB(255, 244, 147, 163);
  static const Color cnBlack = Color(0xff1F1F1F);
  static const Color cnDarkGrey = Color(0xff666666);
  static const Color cnGrey = Color(0xff555557);
  static const Color cnLightGrey = Color.fromARGB(255, 240, 240, 240);
  static const Color cnWhite = Color(0xffFDFDFD);
  static const Color cnErro = Color(0xffCC1100);
  static const Color cnSuccess = Color(0xff9BD900);
  static const Color cnGreenLight = Color.fromARGB(255, 219, 230, 191);
  static const Color cnLightGreySecundary = Color(0xfff5f5f5);
  static const Color cnPinkSecundary = Color(0xffD86262);
  static const Color cnTransparent = Colors.transparent;
}

class _CnColorScheme extends ColorScheme {
  final Color cnBlack;
  final Color cnGreen;
  final Color cnYellow;
  final Color cnCyan;
  final Color cnCyanLight;
  final Color cnPink;
  final Color cnPinkSecundary;
  final Color cnRed;
  final Color cnDarkGrey;
  final Color cnGrey;
  final Color cnTransparent;
  final Color cnLightGrey;
  final Color cnLightGreySecundary;
  final Color cnSuccess;
  final Color cnDarkPurple;
  final Color cnDarkRed;
  final Color cnLightRed;
  final Color cnDarkBlue;
  final Color cnLightBlue;
  final Color cnGreenLight;

  const _CnColorScheme({
    super.brightness = Brightness.light,
    super.primary = _CnThemeColors.cnBlack,
    super.onPrimary = _CnThemeColors.cnWhite,
    super.secondary = _CnThemeColors.cnPurple,
    super.onSecondary = _CnThemeColors.cnWhite,
    super.error = _CnThemeColors.cnErro,
    super.onError = _CnThemeColors.cnWhite,
    super.background = _CnThemeColors.cnWhite,
    super.onBackground = _CnThemeColors.cnBlack,
    super.surface = _CnThemeColors.cnWhite,
    super.onSurface = _CnThemeColors.cnBlack,
    this.cnBlack = _CnThemeColors.cnBlack,
    this.cnYellow = _CnThemeColors.cnYellow,
    this.cnCyan = _CnThemeColors.cnCyan,
    this.cnCyanLight = _CnThemeColors.cnCyanLight,
    this.cnDarkGrey = _CnThemeColors.cnDarkGrey,
    this.cnGreen = _CnThemeColors.cnGreen,
    this.cnGrey = _CnThemeColors.cnGrey,
    this.cnTransparent = _CnThemeColors.cnTransparent,
    this.cnLightGrey = _CnThemeColors.cnLightGrey,
    this.cnLightGreySecundary = _CnThemeColors.cnLightGreySecundary,
    this.cnPink = _CnThemeColors.cnPink,
    this.cnPinkSecundary = _CnThemeColors.cnPinkSecundary,
    this.cnRed = _CnThemeColors.cnRed,
    this.cnSuccess = _CnThemeColors.cnSuccess,
    this.cnDarkPurple = _CnThemeColors.cnDarkPurple,
    this.cnDarkRed = _CnThemeColors.cnDarkRed,
    this.cnDarkBlue = _CnThemeColors.cnDarkBlue,
    this.cnLightRed = _CnThemeColors.cnLightRed,
    this.cnLightBlue = _CnThemeColors.cnLightBlue,
    this.cnGreenLight = _CnThemeColors.cnGreenLight,
  });
}

/// Instanced cn Color Scheme class
const cnColorScheme = _CnColorScheme();
