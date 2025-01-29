import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/auth_viewmodel.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/inputs/cn_primary_input_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatelessWidget {
  final AuthViewmodel authViewmodel;
  const SignUpPage({super.key, required this.authViewmodel});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: 'Vinicius');
    final TextEditingController emailController =
        TextEditingController(text: 'vinicius.p.a.corin@gmail.com');
    final TextEditingController passwordController =
        TextEditingController(text: '123456');
    final TextEditingController confirmPasswordController =
        TextEditingController(text: '123456');
    final theme = Theme.of(context);
    theme.extension<CnTextStyles>();
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
          CnPrimaryTextInput(
            hintText: 'Nome',
            controller: nameController,
          ),
          SizedBox(height: themeSpacing.spacing16px),
          CnPrimaryTextInput(
            hintText: 'Email',
            controller: emailController,
          ),
          SizedBox(height: themeSpacing.spacing16px),
          CnPrimaryTextInput(
            hintText: 'Senha',
            controller: passwordController,
          ),
          SizedBox(height: themeSpacing.spacing16px),
          CnPrimaryTextInput(
            hintText: 'Confirme a senha',
            controller: confirmPasswordController,
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
              authViewmodel.createUser(
                nameController.text,
                emailController.text,
                passwordController.text,
              );
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
