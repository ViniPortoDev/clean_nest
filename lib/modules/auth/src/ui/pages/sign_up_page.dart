import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/auth_viewmodel.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/inputs/cn_primary_input_widget.dart';
import 'package:clean_nest/shared/widgets/texts/cn_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatelessWidget {
  final AuthViewmodel authViewmodel;
  const SignUpPage({super.key, required this.authViewmodel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;
    return CnScaffoldWidget(
      appBar:
          const CnAppBarWidget(title: 'Crie sua conta', showBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Modular.to.pushNamed('setup_profile'),
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
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 24),
          //   child: Divider(),
          // ),
          SizedBox(height: themeSpacing.spacing24px),
          CnPrimaryButtonWidget(
            title: 'Continuar',
            onPressed: () async {
              await authViewmodel.getUser();
              Modular.to.pushNamed('setup_profile');
            },
            height: 70,
          ),
          SizedBox(height: themeSpacing.spacing16px),
          _buildloginSuggestionWidget(
            context: context,
            onLoginTap: () => Modular.to.pushNamed('/auth/'),
          ),
        ],
      ),
    );
  }
}

Widget _buildloginSuggestionWidget({
  required BuildContext context,
  required VoidCallback onLoginTap,
}) {
  return Center(
    child: RichText(
      text: TextSpan(
        text: "Já possui uma conta? ",
        style: TextStyle(fontSize: 14.0, color: cnColorScheme.cnGrey),
        children: [
          TextSpan(
            text: "Faça login",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onLoginTap,
          ),
        ],
      ),
    ),
  );
}
