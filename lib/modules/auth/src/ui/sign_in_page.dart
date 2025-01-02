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

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    return CnScaffoldWidget(
      appBar: const CnAppBarWidget(title: 'Sign In', showBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CnPrimaryTextInput(
            hintText: 'Email',
          ),
          SizedBox(height: themeSpacing!.spacing16px),
          const CnPrimaryTextInput(
            hintText: 'Senha',
          ),
          SizedBox(height: themeSpacing.spacing24px),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          SizedBox(height: themeSpacing.spacing24px),
          CnPrimaryButtonWidget(
            title: 'Sign In',
            onPressed: () {},
            height: 70,
          ),
          SizedBox(height: themeSpacing.spacing16px),
          const CnTextWidget(text: 'Ou'),
          SizedBox(height: themeSpacing.spacing16px),
          CnPrimaryButtonWidget(
            title: 'Login com Google',
            onPressed: () {
              Modular.to.pushNamed('sign_up');
            },
            height: 70,
          ),
       
        ],
      ),
    );
  }
}
