import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/background/screen_background.dart';
import 'package:healtime/src/screens/screens_login_register/register/screen_register_address.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../widgets/text_form_model.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /* Chave Global para o formulario para que seja possível realizar validações */
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  DateTime dtNascimento = DateTime.now();

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
                    Container(
                      margin: EdgeInsets.only(top: size.height * .04),
                      child: Text(
                        'Ainda não tem uma conta cadastrada?',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff1c1c1c),
                            letterSpacing: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
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
                              validator: true,
                              size: size,
                              textLabel: 'Sobrenome',
                              typeKeyboard: TextInputType.text,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Cpf',
                              typeKeyboard: TextInputType.text,
                              obscure: false),
                          GestureDetector(
                            onTap: () async => _selectDate(context),
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.04),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff1c1c1c),
                                      width: 1)),
                              child: Text('Teste'),
                            ),
                          ),
                          ModelTextForm.modelTextForm(
                              validator: false,
                              size: size,
                              textLabel: 'E-Mail',
                              typeKeyboard: TextInputType.emailAddress,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Telefone',
                              typeKeyboard: TextInputType.phone,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Senha',
                              typeKeyboard: TextInputType.text,
                              obscure: true),
                          ModelTextForm.modelTextForm(
                              validator: true,
                              size: size,
                              textLabel: 'Confirmar senha',
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
                                    widget.typeUser == 2
                                        ? 'Finalizar'
                                        : 'Proximo',
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
      if (widget.typeUser != 2) {
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      cancelText: 'CANCELAR',
      confirmText: 'CONFIRMAR',
      fieldHintText: 'Selecione a sua data de nascimento',
      context: context,
      initialDate: dtNascimento,
      firstDate: DateTime(1900, 01),
      lastDate: dtNascimento,
      helpText: '',
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xff172331), // cor do texto dos botões
                ),
              ),
              textTheme: TextTheme(
                //caption: TextStyle(fontSize: 20.0),
                //subtitle2: TextStyle(fontSize: 20.0),
              ),
              dialogTheme: DialogTheme(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              colorScheme: const ColorScheme.light().copyWith(
                primary: Color(0xff18CDCA),
              ),
            ),
            child: child ?? Container());
      },
    );

    // setState(() {
    //   dtNascimento = picker!;
    // });
  }
}
