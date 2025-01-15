import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

// lib/modules/auth/src/ui/pages/choose_mascot_page.dart
import 'package:flutter/material.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart';

class ChooseMascotPage extends StatelessWidget {
  final ChooseMascotViewModel chooseMascotViewModel;

  const ChooseMascotPage({super.key, required this.chooseMascotViewModel});

  @override
  Widget build(BuildContext context) {
    // Carrega os mascotes ao acessar a página
    chooseMascotViewModel.loadMascots();

    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Escolha o Mascote')),
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
            children:
                List.generate(chooseMascotViewModel.mascots.length, (index) {
              final mascot = chooseMascotViewModel.mascots[index];
              return GestureDetector(
                onTap: () {
                  chooseMascotViewModel.selectMascot(mascot);
                },
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      height: size.width * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: mascot.id ==
                                chooseMascotViewModel.selectedMascot?.id
                            ? Border.all(color: cnColorScheme.cnBlack, width: 4)
                            : null,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          mascot
                              .imageUrl, // A URL da imagem é o caminho do asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(mascot.name),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: themeSpacing.spacing24px),
          CnPrimaryButtonWidget(
            title: 'Continuar',
            onPressed: () {
              // Lógica de ação do botão
            },
            height: 70,
          ),
        ],
      ),
    );
  }
}
