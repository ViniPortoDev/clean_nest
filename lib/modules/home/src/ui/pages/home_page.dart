import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
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
      appBar: const CnAppBarWidget(title: 'Home Page', showBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
                onPressed: () => Modular.to.pushNamed('add_task'),
                icon: Icon(Icons.add)),
          ),
        ],
      ),
    );
  }
}
