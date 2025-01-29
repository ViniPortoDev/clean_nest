import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/home/src/ui/viewmodels/home_viewmodel.dart';
import 'package:clean_nest/modules/home/src/ui/viewmodels/task_viewmodel.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/add_task_container_widget.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/select_group_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final TaskViewModel taskViewModel;
  final HomeViewmodel homeViewmodel;
  const HomePage({
    super.key,
    required this.taskViewModel,
    required this.homeViewmodel,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    List<IconData> listIcon = [Icons.home, Icons.add, Icons.person];
    return CnScaffoldWidget(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: listIcon,
        activeIndex: _selectedIndex,
        activeColor: cnColorScheme.primary,
        blurEffect: true,
        elevation: 20,
        height: 65,
        iconSize: 40,


    final List<Member> _members = [
      Member(id: 1, name: 'Membro 1', email: '', tasks: []),
      Member(id: 2, name: 'Membro 2', email: '', tasks: []),
      Member(id: 3, name: 'Membro 3', email: '', tasks: []),
    ];

    return Scaffold(
      appBar: AppBar(
        title: SelectedGroupWidget(
          groupName: widget.homeViewmodel.user?.groups[0].name ??
              'bug', // Nome do grupo selecionado.
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: const EdgeInsets.all(16),
                height: 300,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Opções de Grupos", style: TextStyle(fontSize: 18)),
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
          const CnTextWidget(text: 'Bem vindo ao Clean Nest'),
          SizedBox(height: themeSpacing!.spacing16px),
          Container(
            height: 160,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cnColorScheme.cnBlack),
            ),
            child: const Center(child: CnTextWidget(text: '3 Banners')),
          ),
          SizedBox(height: themeSpacing.spacing32px),
          Container(
            height: 200,
            width: size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 211, 197, 248),
              borderRadius: BorderRadius.circular(12),
            ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          // Lógica ao clicar no botão
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline,
                      color: Colors.blueAccent, size: 32),
                  SizedBox(width: 8),
                  Text(
                    'Adicionar',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              content: Text(
                'Deseja adicionar este item?',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Lógica para adicionar o item
                  },
                  child: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: cnColorScheme.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home_rounded,
          Icons.explore_rounded,
          Icons.leaderboard_rounded,
          Icons.person_rounded,
        ],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        backgroundColor: Colors.white,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey[400],
        iconSize: 28,
        elevation: 8,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        splashColor: Colors.blueAccent.withOpacity(0.2),
        splashSpeedInMilliseconds: 250,
      ),
    );
  }
}
