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

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    return CnScaffoldWidget(
      appBar: const CnAppBarWidget(title: 'Sign Up', showBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Modular.to.pushNamed('choose_mascot'),
            child: Container(
              width: size.width * 0.2,
              height: size.width * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: cnColorScheme.cnBlack),
              ),
            ),
          ),
          SizedBox(height: themeSpacing!.spacing40px),
          const CnPrimaryTextInput(
            hintText: 'Email',
          ),
          SizedBox(height: themeSpacing.spacing16px),
          const CnPrimaryTextInput(
            hintText: 'Senha',
          ),
          SizedBox(height: themeSpacing!.spacing16px),
          const CnPrimaryTextInput(
            hintText: 'Confirme a senha',
          ),
          SizedBox(height: themeSpacing.spacing24px),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          SizedBox(height: themeSpacing.spacing24px),
          CnPrimaryButtonWidget(
            title: 'Sign In',
            onPressed: () {
              Modular.to.pushNamed('/home/');
            },
            height: 70,
          ),
          SizedBox(height: themeSpacing.spacing16px),
          const CnTextWidget(text: 'Ou'),
          SizedBox(height: themeSpacing.spacing16px),
          CnPrimaryButtonWidget(
            title: 'Login com Google',
            onPressed: () {},
            height: 70,
          ),
        ],
      ),
    );
  }
}
