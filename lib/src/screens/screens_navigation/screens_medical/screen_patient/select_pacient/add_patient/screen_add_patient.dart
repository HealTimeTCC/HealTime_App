import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';

import '../../../../../../../shared/decorations/screen_background.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key? key, required this.personId}) : super(key: key);

  // Pessoa? pessoa;

  final int personId;

  @override
  Widget build(BuildContext context) {
    TextEditingController textNomeController = TextEditingController();
    TextEditingController textSobrenomeController = TextEditingController();
    TextEditingController textCpfController = TextEditingController();
    TextEditingController textDataNascimentoController =
        TextEditingController();

    final Size size = MediaQuery.of(context).size;

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
                      SizedBox(width: size.width * .03),
                      Text(
                        'Cadastrar paciente',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff1c1c1c),
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
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
                      CustomField(
                          label: 'Data de Nascimento',
                          textController: textDataNascimentoController,
                          keyboardType: TextInputType.datetime),
                      SizedBox(
                        height: size.height * .09,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Pessoa paciente = Pessoa(
                              cpfPessoa: textCpfController.text,
                              nomePessoa: textNomeController.text,
                              sobreNomePessoa: textSobrenomeController.text,
                              tipoPessoa: personId,
                              dtNascPessoa: DateTime.now(),
                              passwordString: '');
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
                  ))
                ],
              ), 
            ),
          ),
        ],
      ),
    );
  }
}
