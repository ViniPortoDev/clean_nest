import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/select_group_widget.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    int _selectedIndex = 0;
    List<IconData> listIcon = [Icons.home, Icons.settings, Icons.person];
    final List<Widget> _pages = [
      Container(),
      Container(),
      Container(),
    ];
    return CnScaffoldWidget(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: listIcon,
        activeIndex: _selectedIndex,
        activeColor: cnColorScheme.primary,
        blurEffect: true,
        elevation: 20,
        height: 65,
        iconSize: 24,
        inactiveColor: Colors.white,
        // rightCornerRadius: 12,
        // leftCornerRadius: 12,
        splashColor: const Color(0xff424242),
        // backgroundColor: const Color(0xff424242),
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: SelectedGroupWidget(
          groupName: "Familia Porto", // Nome do grupo selecionado.
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: const EdgeInsets.all(16),
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Opções de Grupos", style: TextStyle(fontSize: 18)),
                    // Adicione widgets aqui
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          CnTextWidget(
              text: 'Olá Vinicius Porto',
              textStyle: themeTextStyle!.textLMedium),
          CnTextWidget(text: 'Bem vindo ao Clean Nest'),
          SizedBox(height: themeSpacing!.spacing16px),
          Container(
            height: 160,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cnColorScheme.cnBlack),
            ),
            child: Center(child: CnTextWidget(text: '3 Banners')),
          ),
          SizedBox(height: themeSpacing.spacing32px),
          Container(
            height: 200,
            width: size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 211, 197, 248),
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
                  textStyle: themeTextStyle.textMMedium!
                      .copyWith(color: cnColorScheme.primary),
                ),
                SizedBox(height: themeSpacing.spacing4px),

                CnTextWidget(
                    text: 'Comece adicionando a sua primeira tarefa',
                    textStyle: themeTextStyle.textTMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
