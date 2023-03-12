import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/background/screen_background.dart';
import 'package:healtime/src/screens/screens_login_register/register/screen_register_address.dart';

import '../widgets/text_form_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  /* Chave Global para o formulario para que seja possível realizar validações */
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .05, vertical: size.height * .01),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xff25D8D5),
                            child: Icon(
                              Icons.arrow_back,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'HealTime',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: const Color(0xff1c1c1c),
                                letterSpacing: 1,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Ainda não tem uma conta cadastrada?',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff1c1c1c),
                          letterSpacing: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * .02),
                    Text(
                      'Crie sua conta de forma rápida e fácil agora mesmo!',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff706F6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * .02),
                    Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .02,
                          ),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Nome',
                              typeKeyboard: TextInputType.text,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              validator: false,
                              size: size,
                              textLabel: 'E-Mail',
                              typeKeyboard: TextInputType.text,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Telefone',
                              typeKeyboard: TextInputType.text,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Senha',
                              typeKeyboard: TextInputType.text,
                              obscure: true),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => _validateForm(context),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xff5AECE9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .08,
                                    vertical: size.height * .02),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    typeUser == 2 ? 'Finalizar' : 'Proximo',
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff172331),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(width: size.width * .01),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: Color(0xff172331),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void _validateForm(BuildContext context) {
    final FormState? formState = keyForm.currentState;

    /* Se os registros estiverem 'Ok' */
    if (formState != null && formState.validate()) {
      /* Aqui vai ficar a parte de cadastro e as validações individuais de cada campo */

      /* Se a pessoa for diferente de paciente ela vai ser levada para cadastrar o endereço */
      if (typeUser != 2) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => RegisterAddress(),
          ),
        );
      } else {
        /* Função para cadastrar o paciente capaz */
      }
    } else {
      /* Dar um feedback para o usuário */
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Não foi possível realizar o seu cadastro.'),
        ),
      );
    }
  }
}