import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/decorations/screen_background.dart';

import '../../../../../services/api/api_doctor.dart';
import '../../../../../shared/models/maps/model_uf.dart';
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

  String? valueDrop = 'AC';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_ios_new,
                      color: const Color(0xff18CDCA), size: size.width * .08),
                ),
                SizedBox(width: size.width * .025),
                Expanded(
                  child: Text(
                    'Incluir Médico',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff1c1c1c),
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: size.height * .08),
              Container(
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * .02),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomField(
                          label: 'Nome do Dr.',
                          textController: textNameController,
                          keyboardType: TextInputType.text),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomField(
                              keyboardType: TextInputType.phone,
                              label: 'CRM Médico',
                              textController: textCrmController,
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .02),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(size.width * .02),
                                border: Border.all(
                                    color: const Color(0xff333333), width: 1),
                              ),
                              child: DropdownButton(
                                  borderRadius:
                                      BorderRadius.circular(size.width * .02),
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
                                      child: Text(
                                        e.key,
                                        style: FontGoogle.textNormaleGoogle(
                                          size: size * .8,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      valueDrop = value;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.1),
                      ElevatedButton(
                        onPressed: () async {
                          if (textNameController.text.isEmpty) {
                            _snackMsg(
                                context: context,
                                text:
                                    'Por favor, informe o nome do médico(a).');
                            return;
                          }

                          if (textCrmController.text.isEmpty) {
                            _snackMsg(
                                context: context,
                                text:
                                'Por favor, informe o CRM do médico(a).');
                            return;
                          }

                          Medico doctor = Medico(
                            MedicoId: 0,
                            CrmMedico: textCrmController.text,
                            NmMedico: textNameController.text,
                            UfCrmMedico: ModelUf.Ufs[valueDrop]['codigo_ibge'].toString(),
                          );

                          int statusCode =
                              await ApiMedico.incluirMedico(doctor, context);
                          if (statusCode == 200) {
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .30,
                              vertical: size.height * .01),
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
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
