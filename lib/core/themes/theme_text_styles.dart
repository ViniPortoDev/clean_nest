import 'package:flutter/material.dart';

/// Class to store Cn's text styles
class CnTextStyles extends ThemeExtension<CnTextStyles> {
  /// Heading L Text Style
  final TextStyle? headingL;

  /// Heading M Text Style
  final TextStyle? headingM;

  /// Heading S Text Style
  final TextStyle? headingS;

  /// Heading T Text Style
  final TextStyle? headingT;

  /// Text L Medium Text Style
  final TextStyle? textLMedium;

  /// Text L Regular Text Style
  final TextStyle? textLRegular;

  /// Text M Medium Text Style
  final TextStyle? textMMedium;

  /// Text M Regular Text Style
  final TextStyle? textMRegular;

  /// Text S Regular Text Style
  final TextStyle? textSRegular;

  /// Text S Medium Text Style
  final TextStyle? textSMedium;

  /// Text T Medium Text Style
  final TextStyle? textTMedium;

  /// Text T Regular Text Style
  final TextStyle? textTRegular;

  /// Base constructor of CnTextStyles
  const CnTextStyles({
    this.headingL,
    this.headingM,
    this.headingS,
    this.headingT,
    this.textLMedium,
    this.textLRegular,
    this.textMMedium,
    this.textMRegular,
    this.textSRegular,
    this.textSMedium,
    this.textTMedium,
    this.textTRegular,
  });

  @override
  ThemeExtension<CnTextStyles> copyWith({
    TextStyle? headingL,
    TextStyle? headingM,
    TextStyle? headingS,
    TextStyle? headingT,
    TextStyle? textLMedium,
    TextStyle? textLRegular,
    TextStyle? textMMedium,
    TextStyle? textMRegular,
    TextStyle? textSRegular,
    TextStyle? textSMedium,
    TextStyle? textTMedium,
    TextStyle? textTRegular,
  }) {
    return CnTextStyles(
      headingL: headingL ?? this.headingL,
      headingM: headingM ?? this.headingM,
      headingS: headingS ?? this.headingS,
      headingT: headingT ?? this.headingT,
      textLMedium: textLMedium ?? this.textLMedium,
      textLRegular: textLRegular ?? this.textLRegular,
      textMMedium: textMMedium ?? this.textMMedium,
      textMRegular: textMRegular ?? this.textMRegular,
      textSRegular: textSRegular ?? this.textSRegular,
      textSMedium: textSMedium ?? this.textSMedium,
      textTMedium: textTMedium ?? this.textTMedium,
      textTRegular: textTRegular ?? this.textTRegular,
    );
  }

  @override
  ThemeExtension<CnTextStyles> lerp(
    covariant ThemeExtension<CnTextStyles>? other,
    double t,
  ) {
    if (other is! CnTextStyles) {
      return this;
    }

    return CnTextStyles(
      headingL: TextStyle.lerp(headingL, other.headingL, t),
      headingM: TextStyle.lerp(headingM, other.headingM, t),
      headingS: TextStyle.lerp(headingS, other.headingS, t),
      headingT: TextStyle.lerp(headingT, other.headingT, t),
      textLMedium: TextStyle.lerp(textLMedium, other.textLMedium, t),
      textLRegular: TextStyle.lerp(textLRegular, other.textLRegular, t),
      textMMedium: TextStyle.lerp(textMMedium, other.textMMedium, t),
      textMRegular: TextStyle.lerp(textMRegular, other.textMRegular, t),
      textSRegular: TextStyle.lerp(textSRegular, other.textSRegular, t),
      textSMedium: TextStyle.lerp(textSMedium, other.textSMedium, t),
      textTMedium: TextStyle.lerp(textTMedium, other.textTMedium, t),
      textTRegular: TextStyle.lerp(textTRegular, other.textTRegular, t),
    );
  }
}
