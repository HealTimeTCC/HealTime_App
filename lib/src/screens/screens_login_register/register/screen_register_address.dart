import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/dto/dto_pessoa_register.dart';
import 'package:healtime/shared/models/maps/model_uf.dart';

import '../../../../services/api/api_pessoa.dart';
import '../../screens_navigation/start_view_widget.dart';
import '../widgets/loading_sending_data.dart';
import '../widgets/text_form_model.dart';

class RegisterAddress extends StatefulWidget {
  const RegisterAddress({Key? key, required this.dtoPessoaRegister})
      : super(key: key);

  final DtoPessoaRegister dtoPessoaRegister;

  @override
  State<RegisterAddress> createState() => _RegisterAddressState();
}

class _RegisterAddressState extends State<RegisterAddress> {
  String? valueDrop = 'AC';

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                               Icons.arrow_back_ios_new,
                            size: 35,
                            color: Colors.white,
                            
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'O melhor caminho para a sua saúde',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: Colors.grey[500],
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Dados do endereço',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.underline,
                          color: const Color(0xff1c1c1c),
                          letterSpacing: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  /* Formulario para o cadastro do endereço */
                  Form(
                    key: keyForm,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ModelTextForm.modelTextForm(
                                    validator: true,
                                    size: size,
                                    textLabel: 'Cep',
                                    typeKeyboard: TextInputType.text,
                                    obscure: false),
                              ),
                              SizedBox(width: size.height * 0.05),
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: size.height * 0.04),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Não sei o meu CEP',
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey[500],
                                        letterSpacing: 1,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 2,
                                child: ModelTextForm.modelTextForm(
                                    validator: true,
                                    size: size,
                                    textLabel: 'Rua',
                                    typeKeyboard: TextInputType.text,
                                    obscure: false),
                              ),
                              SizedBox(width: size.width * .05),
                              Expanded(
                                flex: 1,
                                child: ModelTextForm.modelTextForm(
                                    validator: true,
                                    size: size,
                                    textLabel: 'Nro',
                                    typeKeyboard: TextInputType.text,
                                    obscure: false),
                              ),
                            ],
                          ),
                          ModelTextForm.modelTextForm(
                              validator: false,
                              size: size,
                              textLabel: 'Complemento',
                              typeKeyboard: TextInputType.text,
                              obscure: false),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ModelTextForm.modelTextForm(
                                    validator: true,
                                    size: size,
                                    textLabel: 'Cidade',
                                    typeKeyboard: TextInputType.text,
                                    obscure: false),
                              ),
                              SizedBox(width: size.width * .05),

                              /*--------------- Selecionar UF ---------------*/
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: size.height * .04),
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: DropdownButton(
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        underline: Container(
                                          height: 0,
                                          color: Colors.transparent,
                                        ),
                                        value: valueDrop,
                                        isExpanded: true,
                                        menuMaxHeight: size.height * .4,
                                        items: ModelUf.Ufs.entries.map((e) {
                                          return DropdownMenuItem<String>(
                                            value: e.key,
                                            child: Text(e.key),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            valueDrop = value;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          /*----------------- Botão para finalizar cadastro -----------------*/

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
                                    'Finalizar',
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _validateForm(BuildContext context) async {
    final FormState? formState = keyForm.currentState;
    final scaffoldContext = ScaffoldMessenger.of(context);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: LoadingSendingData(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );

    Navigator.of(context).pop();
    scaffoldContext.clearSnackBars();
    if (formState != null && formState.validate()) {
      final int statusCode =
          await ApiPessoa.registerUser(pessoa: widget.dtoPessoaRegister, context: context);

      if (statusCode == 200) {
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const StartWidgetView(),
            ),
          );
        }
      }else {
        /* O erro é aqui */

        scaffoldContext.showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 2),
            content: Text('Não foi possível realizar o cadastro'),
          ),
        );
      }
    }
    else {
      scaffoldContext.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
          content: Text('Não foi possível realizar o cadastro'),
        ),
      );
    }
  }
}
