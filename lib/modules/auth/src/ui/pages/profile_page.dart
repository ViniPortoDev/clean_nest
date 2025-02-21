import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/profile_viewmodel.dart';
import 'package:clean_nest/modules/auth/src/ui/widgets/pagination_container_widget.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/inputs/cn_primary_input_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatefulWidget {
  final ProfileViewModel profileViewModel;

  const ProfilePage({super.key, required this.profileViewModel});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    widget.profileViewModel.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Configure a conta')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CnTextWidget(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut magna quis metus ullamcorper ullamcorper. Vivamus commodo condimentum leo, vel imperdiet metus ullamcorper nec. Nam suscipit lorem vitae pharetra feugiat.'),
              SizedBox(height: themeSpacing!.spacing24px),
              SizedBox(
                height: size.height * 0.6,
                child: PageView(
                  children: [
                    _buildChooseMascotPage(
                        widget.profileViewModel, themeSpacing, size),
                    _buildCreateRotineGroupPage(
                      context,
                      widget.profileViewModel,
                      themeSpacing,
                      themeTextStyle!,
                      size,
                    ),
                  ],
                  onPageChanged: (index) {
                    widget.profileViewModel.setPageIndex(index);
                  },
                ),
              ),
              SizedBox(height: themeSpacing.spacing24px),
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
                          widget.profileViewModel.pageIndexNotifier,
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
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () async {
                      await widget.profileViewModel.updateUser();
                      Modular.to.pushNamed('/home/');
                    },
                    child: const Text('Finalizar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildChooseMascotPage(
  ProfileViewModel setupProfileViewModel,
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
  ProfileViewModel setupProfileViewModel,
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
        onPressed: () {
          setupProfileViewModel.createGroup();
          // Se for necessário exibir algo aqui, deixe o ViewModel controlar a lógica
        },
        height: 70,
      ),

      SizedBox(height: themeSpacing.spacing24px),
    ],
  );
}
