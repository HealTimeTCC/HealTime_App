import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';

import '../../../../../services/api/api_doctor.dart';
import '../../../../../shared/models/model_doctor.dart';

class IncluirMedico extends StatefulWidget {
  const IncluirMedico({super.key});

  @override
  State<IncluirMedico> createState() => _IncluirMedicoState();
}

class _IncluirMedicoState extends State<IncluirMedico> {
  TextEditingController textNameController = TextEditingController();
  TextEditingController textCrmController = TextEditingController();
  TextEditingController textUfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        const BackgroundPage(),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop,
                  icon: Icon(Icons.arrow_back_ios_new,
                      color: Color(0xff18CDCA), size: 35),
                ),
                Expanded(
                  child: Text(
                    'Incluir Médico',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: Color(0xff1c1c1c),
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.12,
          right: 0,
          left: 0,
          child: Container(
            margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff1c1c1c),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                )),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomField(
                      label: 'Nome',
                      textController: textNameController,
                      keyboardType: TextInputType.text),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      SizedBox(
                          width: 170,
                          child: CustomField(
                            keyboardType: TextInputType.phone,
                            label: 'CRM Médico',
                            textController: textCrmController,
                          )),
                      SizedBox(width: size.width * 0.10),
                      SizedBox(
                          width: size.width * .29,
                          child: CustomField(
                              label: 'UF CRM',
                              textController: textUfController,
                              keyboardType: TextInputType.text)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  ElevatedButton(
                    onPressed: () async {
                      Medico doctor = Medico(
                          MedicoId: 0,
                          CrmMedico: textCrmController.text,
                          NmMedico: textNameController.text,
                          UfCrmMedico: textUfController.text);

                      int statusCode = await ApiMedico.incluirMedico(doctor, context);
                      if (statusCode == 200) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .20,
                            vertical: size.height * .02),
                        backgroundColor: const Color(0xff1AE8E4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45))),
                    child: Text(
                      'Adicionar',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(199, 11, 97, 90),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class CustomField extends StatelessWidget {
  final String label;
  TextEditingController textController = TextEditingController();

  CustomField(
      {super.key,
      required this.label,
      required this.textController,
      required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.getFont(
          'Poppins',
          decoration: TextDecoration.none,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
