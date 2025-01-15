import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

class PaginationContainerWidget extends StatelessWidget {
  final int index;
  final bool isSelected;

  const PaginationContainerWidget({
    super.key,
    required this.index,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? cnColorScheme.primary : cnColorScheme.onSecondary,
        border: isSelected
            ? null
            : Border.all(
                color: cnColorScheme.primary,
                width: 1.5,
              ),
      ),
      child: Center(
        child: CnTextWidget(
          text: index.toString(),
          textStyle: TextStyle(
            color: isSelected ? Colors.white : cnColorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: isSelected ? 18 : 16,
          ),
        ),
      ),
    );
  }
}
