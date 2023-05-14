import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/models/enuns/enum_status_medicacao.dart';
import 'package:healtime/shared/models/model_medicacao.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import 'Widget/model_text_field.dart';
import 'logic/medicine.dart';

class IncludeMedication extends StatefulWidget {
  const IncludeMedication({Key? key}) : super(key: key);

  @override
  State<IncludeMedication> createState() => _IncludeMedicationState();
}

class _IncludeMedicationState extends State<IncludeMedication> {
  final TextEditingController _textNameController = TextEditingController();
  final TextEditingController _textComposedController = TextEditingController();
  final TextEditingController _textLaboratoryController =
      TextEditingController();
  final TextEditingController _textGenericController = TextEditingController();

  final List<String> _optionsMedicineGeneric = [
    'Sim, este medicamento é genérico.',
    'Não, este medicamento não é genérico.'
  ];

  String _selectMedicineGeneric = 'N';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          Positioned(
            top: 0,
            right: 20,
            left: 0,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: const Color(0xff18CDCA), size: size.width * .08),
                  ),
                  SizedBox(width: size.width * .02),
                  Expanded(
                    child: Text(
                      'Incluir medicamento',
                      style: FontGoogle.textTitleGoogle(size: size * .9),
                    ),
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height * .07),
                    Text(
                      'Nome*',
                      style: FontGoogle.textSubTitleGoogle(size: size * .85),
                    ),
                    ModelTextField(textFieldController: _textNameController),
                    Text(
                      'Composto ativo*',
                      style: FontGoogle.textSubTitleGoogle(size: size * .85),
                    ),
                    ModelTextField(
                        textFieldController: _textComposedController),
                    Text(
                      'Laboratorio',
                      style: FontGoogle.textSubTitleGoogle(size: size * .85),
                    ),
                    ModelTextField(
                        textFieldController: _textLaboratoryController),
                    Text(
                      'Genérico*',
                      style: FontGoogle.textSubTitleGoogle(size: size * .85),
                    ),
                    SizedBox(height: size.height * .02),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xff333333),
                        ),
                      ),
                      child: DropdownButton(
                        value: _selectMedicineGeneric,
                        style: FontGoogle.textNormaleGoogle(size: size * .68),
                        underline: Container(),
                        borderRadius: BorderRadius.circular(15),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: _optionsMedicineGeneric
                            .map(
                              (e) => DropdownMenuItem(
                                value: (e == 'Sim, este medicamento é genérico.'
                                    ? 'S'
                                    : 'N'),
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectMedicineGeneric = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: size.height * .04),
                    ElevatedButton(
                      onPressed: () async {
                        ModelMedicacao medicine = ModelMedicacao(
                            compostoAtivoMedicacao:
                                _textComposedController.text,
                            generico: _selectMedicineGeneric,
                            laboratorioMedicacao:
                                _textLaboratoryController.text,
                            nomeMedicacao: _textNameController.text,
                            statusMedicacaoId: StatusMedicacao.ativo,
                            tipoMedicacaoId: 1);

                        LogicMedicine.includeMedicine(
                            context: context, medicine: medicine);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xff333333),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Adicionar medicamento',
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
    );
  }
}
