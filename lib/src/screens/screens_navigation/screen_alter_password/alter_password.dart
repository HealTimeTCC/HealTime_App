import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_navigation/screen_alter_password/widget/model_text_field.dart';

import '../../../../shared/decorations/fonts_google.dart';
import '../../../../shared/decorations/screen_background.dart';
import 'logic/alter_password.dart';
import 'widget/snack_bar_error.dart';

class AlterPassword extends StatefulWidget {
  const AlterPassword({Key? key}) : super(key: key);

  @override
  State<AlterPassword> createState() => _AlterPasswordState();
}

class _AlterPasswordState extends State<AlterPassword> {
  final TextEditingController _textOldPassword = TextEditingController();
  final TextEditingController _textNewPassword = TextEditingController();
  final GlobalKey<FormState> _keyOldPassword = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyNemPassword = GlobalKey<FormState>();

  @override
  void dispose() {
    _textNewPassword.dispose();
    _textOldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundPage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: size.width * .08,
                      color: const Color(0xff1AE8E4),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  Expanded(
                    child: Text(
                      'Alterar senha',
                      style: FontGoogle.textTitleGoogle(size: size),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .1, vertical: size.height * .02),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: size.height * .08),
                      Text(
                        'Senha antiga',
                        style: FontGoogle.textSubTitleGoogle(size: size * .85),
                      ),
                      SizedBox(height: size.height * .005),
                      ModelTextFieldPasswordAlter(
                          keyText: _keyOldPassword,
                          textDescription: 'Informe aqui....',
                          textDescriptionController: _textOldPassword),
                      SizedBox(height: size.height * .03),
                      Text(
                        'Senha nova',
                        style: FontGoogle.textSubTitleGoogle(size: size * .85),
                      ),
                      SizedBox(height: size.height * .005),
                      ModelTextFieldPasswordAlter(
                          keyText: _keyNemPassword,
                          textDescription: 'Informe aqui...',
                          textDescriptionController: _textNewPassword),
                      SizedBox(height: size.height * .05),
                      ElevatedButton(
                        onPressed: _validateData,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: const Color(0xff333333),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Confirmar',
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: size.width * .04,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _validateData() async {
    if (_textOldPassword.text.isEmpty) {
      SnackBarError.snackBarError(
          context: context, msg: 'Senha antiga inválida.');
    } else if (_textNewPassword.text.isEmpty) {
      SnackBarError.snackBarError(
          context: context, msg: 'Nova senha inválida');
    } else {
      await LogicAlterPassword.alterPassword(context: context,
          oldPassword: _textNewPassword.text,
          newPassword: _textOldPassword.text);
    }
  }
}
