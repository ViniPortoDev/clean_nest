import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CnPrimaryTextInput extends StatefulWidget {
  /// Defines text editing controller.
  final TextEditingController? controller;

  ///Defines on changed of text field
  final void Function(String)? onChanged;

  /// Defines validator.
  final String? Function(String?)? validator;

  /// Defines on submit function
  final Function(String)? onSubmited;

  /// Defines label.
  final String label;

  /// Defines sufix icon.
  final Widget? suffixIcon;

  /// Defines helper text.
  final String helperText;

  /// Defines width.
  final double? width;

  /// Defines maxLength
  final int? maxLength;

  /// Defines keyboardType
  final TextInputType? keyboardType;

  /// Defines focusNode
  final FocusNode? focusNode;

  /// Defines if is loading.
  final bool isLoading;

  /// Defines if enable.
  final bool enable;

  /// Defines if expands
  final bool expands;

  final bool filled;

  /// Defines hintText
  final String? hintText;

  /// Defines hintStyle
  final TextStyle? hintStyle;

  /// Defines hintMaxLines
  final int? hintMaxLines;

  final String? counterText;

  /// Defines minLines
  final int? minLines;

  /// Defines maxLines
  final int? maxLines;

  /// Defines hintTextDirection
  final TextDirection? hintTextDirection;

  /// Defines inputFormatters
  final List<TextInputFormatter>? inputFormatters;

  /// Defines textAlignVertical
  final TextAlignVertical? textAlignVertical;

  final EdgeInsetsGeometry? contentPadding;

  /// Defines "CnPrimaryTextInput" constructor.
  const CnPrimaryTextInput(
      {super.key,
      this.controller,
      this.validator,
      this.onChanged,
      this.label = '',
      this.suffixIcon,
      this.helperText = '',
      this.width,
      this.onSubmited,
      this.isLoading = false,
      this.enable = true,
      this.filled = true,
      this.maxLength,
      this.keyboardType,
      this.focusNode,
      this.inputFormatters,
      this.hintText,
      this.hintStyle,
      this.hintMaxLines,
      this.hintTextDirection,
      this.counterText,
      this.minLines,
      this.maxLines,
      this.textAlignVertical,
      this.contentPadding,
      this.expands = false});

  @override
  State<CnPrimaryTextInput> createState() => _CnPrimaryTextInputState();
}

class _CnPrimaryTextInputState extends State<CnPrimaryTextInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();

    final enableColor = cnColorScheme.cnBlack;

    return SizedBox(
      width: widget.width,
      child: TextFormField(
        expands: widget.expands,
        textAlignVertical: widget.textAlignVertical,
        keyboardType: widget.keyboardType,
        minLines: widget.minLines,
        maxLines: widget.maxLines, // and this
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        style: themeTextStyle?.textLMedium?.copyWith(
          color: enableColor,
        ),
        enabled: widget.enable,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmited,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText, // Sempre visível
          hintStyle: widget.hintStyle ?? themeTextStyle!.textMRegular,
          hintMaxLines: widget.hintMaxLines,
          hintTextDirection: widget.hintTextDirection,
          filled: widget.filled,
          fillColor: cnColorScheme.cnLightGrey,
          counterText: widget.counterText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16, // Centraliza verticalmente
            horizontal: 24,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

          label: null,
          labelStyle: null,
        ),
      ),
    );
  }
}
