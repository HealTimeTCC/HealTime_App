import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healtime/src/screens/telas_login_register/login/widgets/text_form_model.dart';

import '../../../../shared/background/background_page.dart';
import '../../telas_navegacao/home_page/home.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Entre com a sua conta',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff1c1c1c),
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * .02),
                    Text(
                      'Não se preocupe! Seus dados estão completamente seguros com a '
                      'equipe do HealTime.',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: size.height * .06),
                    Form(
                      child: Column(
                        children: [
                          ModelTextForm.modelTextForm(
                              textLabel: 'Nome usuário/e-mail',
                              typeKeyboard: TextInputType.emailAddress,
                              size: size,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              textLabel: 'Senha',
                              typeKeyboard: TextInputType.text,
                              size: size,
                              obscure: true),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueceu a senha?',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.underline,
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    ElevatedButton(
                      onPressed: () =>  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                      ),
                    ) ,
                      style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * .02),
                          backgroundColor: const Color(0xff1AE8E4),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45))),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: size.height * .07),
                    Text(
                      'Ou entre com',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: size.width * .02,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/svg/logoGoogle.svg'),
                            padding: EdgeInsets.zero),
                        IconButton(
                            onPressed: () {},
                            icon:
                                SvgPicture.asset('assets/svg/logoFacebook.svg'),
                            padding: EdgeInsets.zero),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
