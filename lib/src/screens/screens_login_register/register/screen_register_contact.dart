import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/src/screens/screens_login_register/register/screen_register_address.dart';

import '../../../../services/api/api_pessoa.dart';
import '../../../../shared/dto/dto_pessoa_register.dart';
import '../../screens_navigation/home_page/home.dart';
import '../widgets/loading_sending_data.dart';
import '../widgets/text_form_model.dart';

class RegisterContactScreen extends StatefulWidget {
  const RegisterContactScreen({Key? key, required this.pessoa})
      : super(key: key);
  final DtoPessoaRegister pessoa;

  @override
  State<RegisterContactScreen> createState() => _RegisterContactScreenState();
}

class _RegisterContactScreenState extends State<RegisterContactScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedPasswordController =
      TextEditingController();

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    SizedBox(height: size.height * .04),
                    Text(
                      'Crie sua conta de forma rápida e fácil agora mesmo!',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff706F6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * .03),
                    Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          ModelTextForm.modelTextForm(
                              textController: emailController,

                              /* Flag para verificar se é para validar o TExtField */
                              validator: false,
                              size: size,
                              textLabel: 'E-Mail',
                              typeKeyboard: TextInputType.emailAddress,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              textController: phoneController,
                              validator: true,
                              size: size,
                              textLabel: 'Celular',
                              typeKeyboard: TextInputType.phone,
                              obscure: false),
                          ModelTextForm.modelTextForm(
                              textController: passwordController,
                              validator: true,
                              size: size,
                              textLabel: 'Senha',
                              typeKeyboard: TextInputType.text,
                              obscure: true),
                          ModelTextForm.modelTextForm(
                              textController: confirmedPasswordController,
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
                                    widget.pessoa.tipoPessoaId == 2
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

  void _validateForm(BuildContext context) async {
    final FormState? formState = keyForm.currentState;

    /* Se os registros estiverem 'Ok' */
    if (formState != null && formState.validate()) {
      if (validateData()) {
        /* Função para cadastrar o paciente capaz */
        widget.pessoa.passwordString = passwordController.text;
        widget.pessoa.contatoCelular = phoneController.text;
        widget.pessoa.contatoEmail = emailController.text;

        /* Se a pessoa for diferente de paciente ela vai ser levada para cadastrar o endereço */
        if (widget.pessoa.tipoPessoaId != 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  RegisterAddress(dtoPessoaRegister: widget.pessoa),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: LoadingSendingData(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );

          final int statusCode =
              await ApiPessoa.registerUser(pessoa: widget.pessoa, context: context);

          if (mounted) {
            Navigator.of(context).pop();
            if (statusCode == 200) {
              if (mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }
            } else {
              messageError(
                  context: context, text: 'Não foi possível realizar o cadastro');
            }
          }
        }
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

  /* Validar os campos de texto */
  bool validateData() {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (!emailController.text.contains('@')) {
      messageError(context: context, text: 'E-mail inválido');
      return false;
    }
    if (phoneController.text.length != 11) {
      messageError(context: context, text: 'Número de telefone inválido.');
      return false;
    }
    if (passwordController.text != confirmedPasswordController.text) {
      messageError(context: context, text: 'As duas senhas não estão iguais.');
      return false;
    }
    return true;
  }

  /* Função para exibir as mensagens de erro */
  messageError({required String text, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(text),
      ),
    );
  }
}
