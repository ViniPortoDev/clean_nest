import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/setup_profile_viewmodel.dart';
import 'package:clean_nest/modules/auth/src/ui/widgets/pagination_container_widget.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

class SetupProfilePage extends StatelessWidget {
  final SetupProfileViewModel setupProfileViewModel;

  const SetupProfilePage({super.key, required this.setupProfileViewModel});

  @override
  Widget build(BuildContext context) {
    // Carrega os mascotes ao acessar a página
    setupProfileViewModel.loadMascots();

    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Configure a conta')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CnTextWidget(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut magna quis metus ullamcorper ullamcorper. Vivamus commodo condimentum leo, vel imperdiet metus ullamcorper nec. Nam suscipit lorem vitae pharetra feugiat.'),
            SizedBox(height: themeSpacing!.spacing24px),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 50),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: themeSpacing.spacing12px),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    PaginationContainerWidget(index: index + 1),
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: PageView(
                children: [
                  _buildChooseMascotPage(
                      setupProfileViewModel, themeSpacing, size),
                  _buildCreateRotineGroupPage(setupProfileViewModel,
                      themeSpacing, themeTextStyle!, size),
                ],
              ),
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
      ),
    );
  }
}

Widget _buildChooseMascotPage(
  SetupProfileViewModel setupProfileViewModel,
  CnSpacing themeSpacing,
  Size size,
) {
  return Column(
    children: [
      SizedBox(height: themeSpacing.spacing32px),
      const CnTextWidget(text: 'Escolha o seu mascote'),
      SizedBox(height: themeSpacing.spacing24px),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: List.generate(setupProfileViewModel.mascots.length, (index) {
          final mascot = setupProfileViewModel.mascots[index];
          return GestureDetector(
            onTap: () {
              setupProfileViewModel.selectMascot(mascot);
            },
            child: Column(
              children: [
                Container(
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: mascot.id ==
                            setupProfileViewModel.selectedMascot?.id
                        ? Border.all(color: cnColorScheme.primary, width: 2.5)
                        : null,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      mascot.imageUrl, // A URL da imagem é o caminho do asset
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
    ],
  );
}

Widget _buildCreateRotineGroupPage(
  SetupProfileViewModel setupProfileViewModel,
  CnSpacing themeSpacing,
  CnTextStyles themeTextStyle,
  Size size,
) {
  return Column(
    children: [
      SizedBox(height: themeSpacing.spacing32px),
      Image.asset('assets/images/news.png', height: 200),
      SizedBox(height: themeSpacing.spacing32px),
      Text(
        'Crie um grupo para dividir suas rotinas, Divida tarefas e mantenha todos organizados! 📝',
        style:
            themeTextStyle.textMMedium!.copyWith(color: cnColorScheme.primary),
        textAlign: TextAlign.center,
      ),

      SizedBox(height: themeSpacing.spacing16px),
      Text(
        'Com o grupo, você poderá distribuir tarefas e se organizar melhor com amigos ou família. Tudo em um lugar fácil e divertido!',
        style: themeTextStyle.textSMedium,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: themeSpacing.spacing24px),

      // Campo de texto para o nome do grupo
      TextField(
        decoration: InputDecoration(
          labelText: 'Nome do Grupo',
          labelStyle: themeTextStyle.textTRegular!.copyWith(
            color: cnColorScheme.primary,
          ),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(12),
        ),
        style: themeTextStyle.headingM,
      ),
      SizedBox(height: themeSpacing.spacing24px),

      // Botão para criar o grupo
      CnPrimaryButtonWidget(
        width: 200,
        title: 'Crie o grupo',
        onPressed: () {},
      ),
      SizedBox(height: themeSpacing.spacing16px),

      // Texto informativo adicional
    ],
  );
}
