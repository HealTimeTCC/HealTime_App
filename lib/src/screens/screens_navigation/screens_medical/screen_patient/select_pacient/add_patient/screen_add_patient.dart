import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/provider/queries/provider_queries.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/register_queries/logic/date_time_query.dart';
import 'package:intl/intl.dart';

import '../../../../../../../shared/decorations/screen_background.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key? key, required this.personId}) : super(key: key);

  // Pessoa? pessoa;
  //final List<String>
  final int personId;

  @override
  Widget build(BuildContext context) {
    TextEditingController textNomeController = TextEditingController();
    TextEditingController textSobrenomeController = TextEditingController();
    TextEditingController textCpfController = TextEditingController();
    // TextEditingController textGen eroController = TextEditingController();
    TextEditingController textDataNascimentoController =
        TextEditingController();

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .09),
              child: SingleChildScrollView(
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
                        SizedBox(width: size.width * .03),
                        Text(
                          'Cadastrar paciente',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * .04),
                    Positioned(
                        child: Column(
                      children: [
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
                        CustomField(
                          label: 'CPF',
                          textController: textDataNascimentoController,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: size.height * .04),
                        GestureDetector(
                          onTap: () async =>
                              await DateTimeQuery.selectDate(context, true),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .05),
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xff333333),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        ProviderQueries().dtAgendamento!),
                                    textAlign: TextAlign.left,
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .8),
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Color(0xff1c1c1c),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * .02),
                        //DropdownButton(items: items, onChanged: onChanged)
                        SizedBox(
                          height: size.height * .07,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            print("tap");
                            Pessoa paciente = Pessoa(
                                cpfPessoa: textCpfController.text,
                                nomePessoa: textNomeController.text,
                                sobreNomePessoa: textSobrenomeController.text,
                                tipoPessoa: personId,
                                dtNascPessoa:
                                    DateTime.now(), //colocar calendario
                                passwordString: '');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .29,
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
                    ))
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
