import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/inputs/cn_primary_input_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChooseMascotPage extends StatelessWidget {
  const ChooseMascotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    return CnScaffoldWidget(
      appBar: const CnAppBarWidget(
          title: 'Escolha o mascote', showBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CnTextWidget(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut magna quis metus ullamcorper ullamcorper. Vivamus commodo condimentum leo, vel imperdiet metus ullamcorper nec. Nam suscipit lorem vitae pharetra feugiat.'),
          SizedBox(height: themeSpacing!.spacing24px),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cnColorScheme.cnPink,
                ),
                child: const Center(
                  child: CnTextWidget(
                    text: '2',
                  ),
                ),
              ),
              SizedBox(width: themeSpacing!.spacing24px),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cnColorScheme.cnPink,
                ),
                child: const Center(
                  child: CnTextWidget(
                    text: '1',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: themeSpacing.spacing24px),
          CnTextWidget(text: 'Escolha o seu mascote'),
          SizedBox(height: themeSpacing.spacing24px),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cnColorScheme.cnBlack),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cnColorScheme.cnBlack),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cnColorScheme.cnBlack),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cnColorScheme.cnBlack),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cnColorScheme.cnBlack),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cnColorScheme.cnBlack),
                ),
              ),
            ],
          ),
          SizedBox(height: themeSpacing.spacing24px),
          CnPrimaryButtonWidget(
            title: 'Continuar',
            onPressed: () {},
            height: 70,
          ),
        ],
      ),
    );
  }
}
