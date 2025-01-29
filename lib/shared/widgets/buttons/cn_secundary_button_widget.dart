import 'package:clean_nest/core/themes/themes.dart';
import 'package:flutter/material.dart';

class CnSecundaryButtonWidget extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isEnabled;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? enabledColor; // Cor do botão habilitado
  final Color? disabledColor; // Cor do botão desabilitado
  final Color? textColor; // Cor do texto

  const CnSecundaryButtonWidget({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = true,
    required this.onPressed,
    this.width,
    this.height,
    this.enabledColor,
    this.disabledColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.0,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => isEnabled
                ? (enabledColor ?? cnColorScheme.tertiary)
                : (disabledColor ?? Theme.of(context).disabledColor),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Icon(
                prefixIcon,
                size: 20,
                color: isEnabled
                    ? (textColor ?? cnColorScheme.primary)
                    : (disabledColor ?? cnColorScheme.cnGrey),
              ),
            if (prefixIcon != null) const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isEnabled
                    ? (textColor ?? cnColorScheme.primary)
                    : (disabledColor ?? cnColorScheme.cnGrey),
                fontWeight: FontWeight.bold,
              ),
            ),
            if (suffixIcon != null) const SizedBox(width: 8),
            if (suffixIcon != null)
              Icon(
                suffixIcon,
                size: 20,
                color: isEnabled
                    ? (textColor ?? cnColorScheme.primary)
                    : (disabledColor ?? cnColorScheme.cnGrey),
              ),
          ],
        ),
      ),
    );
  }
}
