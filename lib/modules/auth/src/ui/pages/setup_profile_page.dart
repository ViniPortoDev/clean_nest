import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/setup_profile_viewmodel.dart';
import 'package:clean_nest/modules/auth/src/ui/widgets/pagination_container_widget.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/inputs/cn_primary_input_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

class SetupProfilePage extends StatefulWidget {
  final SetupProfileViewModel setupProfileViewModel;

  const SetupProfilePage({super.key, required this.setupProfileViewModel});

  @override
  State<SetupProfilePage> createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  @override
  void initState() {
    super.initState();
    widget.setupProfileViewModel.loadUser();
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder<int>(
                    valueListenable:
                        widget.setupProfileViewModel.pageIndexNotifier,
                    builder: (context, currentPageIndex, child) {
                      return PaginationContainerWidget(
                        index: index + 1,
                        isSelected: currentPageIndex == index,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: PageView(
                children: [
                  _buildChooseMascotPage(
                      widget.setupProfileViewModel, themeSpacing, size),
                  _buildCreateRotineGroupPage(
                    context,
                    widget.setupProfileViewModel,
                    themeSpacing,
                    themeTextStyle!,
                    size,
                  ),
                ],
                onPageChanged: (index) {
                  widget.setupProfileViewModel.setPageIndex(index);
                },
              ),
            ),
            SizedBox(height: themeSpacing.spacing24px),
            // Notificação de mensagens (Sucesso/Erro)
            ValueListenableBuilder<String?>(
              valueListenable: widget.setupProfileViewModel.messageNotifier,
              builder: (context, message, child) {
                if (message != null) {
                  // Exibe o SnackBar com a mensagem
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  });
                }
                return Container();
              },
            ),
            CnPrimaryButtonWidget(
              title: 'Continuar',
              onPressed: () {
                print(widget.setupProfileViewModel.user);
                // Modular.to.pushNamed('/home/');
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
  return AnimatedBuilder(
    animation: setupProfileViewModel,
    builder: (context, _) {
      return Column(
        children: [
          SizedBox(height: themeSpacing.spacing32px),
          const CnTextWidget(text: 'Escolha o seu mascote'),
          SizedBox(height: themeSpacing.spacing24px),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              setupProfileViewModel.mascots.length,
              (index) {
                final mascot = setupProfileViewModel.mascots[index];
                return GestureDetector(
                  onTap: () async {
                    await setupProfileViewModel.selectMascot(mascot);
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
                              ? Border.all(
                                  color: cnColorScheme.primary,
                                  width: 2.5,
                                )
                              : null,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            mascot.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(mascot.name),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildCreateRotineGroupPage(
  BuildContext context,
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
      CnPrimaryTextInput(
        hintText: 'Nome do Grupo',
        controller: setupProfileViewModel.groupNameController,
      ),
      SizedBox(height: themeSpacing.spacing24px),

      // Botão para criar o grupo
      CnPrimaryButtonWidget(
        title: 'Criar Grupo',
        onPressed: () async {
          await setupProfileViewModel.createGroup();
          // Se for necessário exibir algo aqui, deixe o ViewModel controlar a lógica
        },
        height: 70,
      ),

      SizedBox(height: themeSpacing.spacing24px),
    ],
  );
}
