// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// Class to store Cn's spacing
class CnSpacing extends ThemeExtension<CnSpacing> {
  /// Defines the smallest spacing with 4px
  final double? spacing4px;

  /// Defines another small spacing with 8px
  final double? spacing8px;

  /// Defines another small spacing of 12px
  final double? spacing12px;

  /// Defines another small spacin of 16px
  final double? spacing16px;

  /// Defines a medium spacing of 24px
  final double? spacing24px;

  /// Defines another medium spacing of 32px
  final double? spacing32px;

  /// Defines another medium spacing of 40px
  final double? spacing40px;

  /// Defines another medium spacing of 48px
  final double? spacing48px;

  /// Defines a big spacing of 64px
  final double? spacing64px;

  /// Defines another big spacing of 80px
  final double? spacing80px;

  /// Defines another big spacing of 96px
  final double? spacing96px;

  /// Defines the biggest spacing of 106px
  final double? spacing106px;

  /// Defines the biggest spacing of 128px
  final double? spacing128px;

  /// Base constructor of CnSpacing
  const CnSpacing({
    this.spacing4px,
    this.spacing8px,
    this.spacing12px,
    this.spacing16px,
    this.spacing24px,
    this.spacing32px,
    this.spacing40px,
    this.spacing48px,
    this.spacing64px,
    this.spacing80px,
    this.spacing96px,
    this.spacing106px,
    this.spacing128px,
  });

  @override
  ThemeExtension<CnSpacing> copyWith({
    double? spacing4px,
    double? spacing8px,
    double? spacing12px,
    double? spacing16px,
    double? spacing24px,
    double? spacing32px,
    double? spacing40px,
    double? spacing48px,
    double? spacing64px,
    double? spacing80px,
    double? spacing96px,
    double? spacing106px,
    double? spacing128px,
  }) {
    return CnSpacing(
      spacing4px: spacing4px ?? this.spacing4px,
      spacing8px: spacing8px ?? this.spacing8px,
      spacing12px: spacing12px ?? this.spacing12px,
      spacing16px: spacing16px ?? this.spacing16px,
      spacing24px: spacing24px ?? this.spacing24px,
      spacing32px: spacing32px ?? this.spacing32px,
      spacing40px: spacing40px ?? this.spacing40px,
      spacing48px: spacing48px ?? this.spacing48px,
      spacing64px: spacing64px ?? this.spacing64px,
      spacing80px: spacing80px ?? this.spacing80px,
      spacing96px: spacing96px ?? this.spacing96px,
      spacing106px: spacing106px ?? this.spacing106px,
      spacing128px: spacing128px ?? this.spacing128px,
    );
  }

  @override
  ThemeExtension<CnSpacing> lerp(
    covariant ThemeExtension<CnSpacing>? other,
    double t,
  ) {
    if (other is! CnSpacing) {
      return this;
    }

    return CnSpacing(
      spacing4px: spacing4px,
      spacing8px: spacing8px,
      spacing12px: spacing12px,
      spacing16px: spacing16px,
      spacing24px: spacing24px,
      spacing32px: spacing32px,
      spacing40px: spacing40px,
      spacing48px: spacing48px,
      spacing64px: spacing64px,
      spacing80px: spacing80px,
      spacing96px: spacing96px,
      spacing106px: spacing106px,
      spacing128px: spacing128px,
    );
  }
}
