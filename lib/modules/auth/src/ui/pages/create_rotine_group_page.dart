import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:flutter/material.dart';

class CreateRotineGroupPage extends StatelessWidget {
  const CreateRotineGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;

    return CnScaffoldWidget(
      appBar: const CnAppBarWidget(
        title: 'Crie um grupo para rotina',
        showBackButton: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone e título do grupo
              Icon(
                Icons.group_add,
                size: 60,
                color: theme.primaryColor,
              ),
              SizedBox(height: themeSpacing!.spacing16px),
              Text(
                'Crie um grupo para dividir suas rotinas!',
                style: themeTextStyle!.textMMedium!
                    .copyWith(color: theme.primaryColor),
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
                    color: theme.primaryColor,
                  ),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
                style: themeTextStyle.headingM,
              ),
              SizedBox(height: themeSpacing.spacing24px),

              // Botão para criar o grupo
              ElevatedButton(
                onPressed: () {
                  // Lógica para criar o grupo
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                ),
                child: Text(
                  'Criar Grupo',
                  style: themeTextStyle.headingS!.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: themeSpacing.spacing16px),

              // Texto informativo adicional
              Text(
                'Divida tarefas e mantenha todos organizados! 📝',
                style: themeTextStyle.textMMedium!
                    .copyWith(color: theme.primaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
