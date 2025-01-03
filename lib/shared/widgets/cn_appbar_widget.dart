import 'package:clean_nest/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CnAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final bool showBackButton;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? elevation;

  const CnAppBarWidget({
    super.key,
    this.title,
    this.titleStyle,
    this.showBackButton = false,
    this.backgroundColor,
    this.actions,
    this.leading,
    this.bottom,
    this.elevation = 0.0, // Default: no elevation
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? cnColorScheme.cnTransparent,
      elevation: elevation,
      centerTitle: true,
      title: title != null
          ? Text(title!,
              style: titleStyle ?? Theme.of(context).textTheme.titleMedium)
          : null,
      // leading: Icon(Icons.ad_units),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: cnColorScheme.cnBlack,
              onPressed: () => Modular.to.pop(),
            )
          : const SizedBox.shrink(),
      actions: actions,
      bottom: bottom,
    );
  }
}
