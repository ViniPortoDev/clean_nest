import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

class AddTaskContainerWidget extends StatelessWidget {
  final void Function()? onTap;
  const AddTaskContainerWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: size.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 197, 248),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 80,
              color: cnColorScheme.primary,
            ),
            // SizedBox(height: themeSpacing.spacing8px),
            CnTextWidget(
              text: 'Adicione uma tarefa',
              textStyle: themeTextStyle!.textMMedium!
                  .copyWith(color: cnColorScheme.primary),
            ),
            SizedBox(height: themeSpacing!.spacing4px),

            CnTextWidget(
                text: 'Comece adicionando a sua primeira tarefa',
                textStyle: themeTextStyle.textTMedium),
          ],
        ),
      ),
    );
  }
}
