import 'package:flutter/material.dart';

class CnScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  final EdgeInsets bodyPadding;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool safeArea;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CnScaffoldWidget({
    super.key,
    required this.body,
    this.backgroundColor,
    this.bodyPadding = const EdgeInsets.all(24),
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.safeArea = true,
    this.floatingActionButtonLocation, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: safeArea
          ? SafeArea(
              // Usa o SafeArea se o parâmetro for true
              child: Padding(
                padding: bodyPadding,
                child: body,
              ),
            )
          : Padding(
              padding: bodyPadding,
              child: body, // Não usa o SafeArea, apenas o Padding
            ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
