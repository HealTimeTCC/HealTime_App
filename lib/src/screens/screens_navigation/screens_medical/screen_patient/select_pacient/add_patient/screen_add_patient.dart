import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/api/api_patient.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:healtime/services/provider/provider_user.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/dto/dto_patient.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/register_queries/logic/date_time_query.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../../shared/decorations/screen_background.dart';

class AddPatient extends StatelessWidget {
  AddPatient({Key? key, required this.personId}) : super(key: key);

  final int personId;
  final TextEditingController textNomeController = TextEditingController();
  final TextEditingController textSobrenomeController = TextEditingController();
  final TextEditingController textCpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    late ProviderHomePage providerHomePage =
        Provider.of(context, listen: false);
    final ProviderPerson providerPerson = Provider.of<ProviderPerson>(context);
    final Pessoa person = providerPerson.person!;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              child: Column(
                children: [
                  SizedBox(height: size.height * .01),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Color(0xff1AE8E4),
                        ),
                      ),
                      SizedBox(width: size.width * .05),
                      Text(
                        'Cadastrar paciente',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff1c1c1c),
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .05),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13),
                    child: Column(
                      children: [
                        CustomField(
                            label: 'CPF',
                            textController: textCpfController,
                            keyboardType: TextInputType.text),
                        SizedBox(height: size.height * .04),
                        CustomField(
                            label: 'Nome',
                            textController: textNomeController,
                            keyboardType: TextInputType.text),
                        SizedBox(height: size.height * .04),
                        CustomField(
                            label: 'Sobrenome',
                            textController: textSobrenomeController,
                            keyboardType: TextInputType.text),
                        SizedBox(height: size.height * .04),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            print("tap");
                            if (textCpfController.text.isEmpty) {
                              _snackMsg(
                                  context: context,
                                  text:
                                      'Por favor, informe o CPF do paciente.');
                              return;
                            }
                            if (textNomeController.text.isEmpty) {
                              _snackMsg(
                                  context: context,
                                  text:
                                      'Por favor, informe o nome do paciente.');
                              return;
                            }
                            if (textSobrenomeController.text.isEmpty) {
                              _snackMsg(
                                  context: context,
                                  text:
                                      'Por favor, informe o sobrenome do paciente.');
                              return;
                            }

                            Patient paciente = Patient(
                                cpfPessoa: textCpfController.text,
                                nomePessoa: textNomeController.text,
                                sobreNomePessoa: textSobrenomeController.text,
                                //dtNascPessoa: DateTime.now(),
                                tipoPessoa: 2,
                                pessoaId: personId
                                //passwordString: "",
                                );

                            Map<String, dynamic> statusCode =
                                await ApiPaciente.PostPaciente(
                                    context: context, paciente: paciente);

                            if (context.mounted) {
                              await ApiPaciente.PostAssociateResponsibleCarer(
                                  context: context, pessoa: statusCode['body']);
                            }

                            if (statusCode['statusCode'] == 200) {
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                              print("foi :) ");
                            } else {
                              print("noo");
                              return;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .30,
                                vertical: size.height * .02),
                            backgroundColor: const Color(0xff333333),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Adicionar',
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _snackMsg({
  required BuildContext context,
  required String text,
}) {
  final Size size = MediaQuery.of(context).size;

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * .02),
      ),
      content: Text(
        text,
        style: FontGoogle.textNormaleGoogle(
          size: size * .7,
          colorText: Colors.white,
        ),
      ),
    ),
  );
}

class CustomField extends StatelessWidget {
  final String label;
  TextEditingController textController = TextEditingController();

  CustomField({
    super.key,
    required this.label,
    required this.textController,
    required TextInputType keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * .02),
        border: Border.all(color: const Color(0xff333333), width: 1),
      ),
      child: TextField(
        controller: textController,
        cursorColor: const Color(0xff333333),
        style: FontGoogle.textNormaleGoogle(
          size: size * .8,
        ),
        decoration: InputDecoration(
            hintText: label,
            hintStyle: FontGoogle.textNormaleGoogle(
              size: size * .8,
              colorText: Colors.grey.shade500,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
