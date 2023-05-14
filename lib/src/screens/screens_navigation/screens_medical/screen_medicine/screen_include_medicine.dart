import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import 'Widget/model_text_field.dart';

class IncludeMedication extends StatefulWidget {
  const IncludeMedication({Key? key}) : super(key: key);

  @override
  State<IncludeMedication> createState() => _IncludeMedicationState();
}

class _IncludeMedicationState extends State<IncludeMedication> {

  final TextEditingController _textNameController = TextEditingController();
  final TextEditingController _textComposedController = TextEditingController();
  final TextEditingController _textLaboratoryController = TextEditingController();
  final TextEditingController _textGenericController = TextEditingController();

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
                  ModelTextField(textFieldController: _textComposedController),

                  Text(
                    'Laboratorio',
                    style: FontGoogle.textSubTitleGoogle(size: size * .85),
                  ),
                  ModelTextField(textFieldController: _textLaboratoryController),

                  Text(
                    'Genérico*',
                    style: FontGoogle.textSubTitleGoogle(size: size * .85),
                  ),
                  ModelTextField(textFieldController: _textGenericController),

                  SizedBox(height: size.height * .04),
                  ElevatedButton(
                    onPressed: () async {},
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
          )
        ],
      ),
    );
  }
}
