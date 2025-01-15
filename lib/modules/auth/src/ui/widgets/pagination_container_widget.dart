import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

class PaginationContainerWidget extends StatelessWidget {
  final int index;
  const PaginationContainerWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: cnColorScheme.primary,
      ),
      child: Center(
        child: CnTextWidget(
          text: index.toString(),
        ),
      ),
    );
  }
}
