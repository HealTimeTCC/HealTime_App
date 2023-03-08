import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/background/background_page.dart';

import '../../../../../shared/models/medico.dart';
import '../telas_auxiliares/tela_medico.dart';

class PrescricaoMedicamento extends StatefulWidget {
  const PrescricaoMedicamento({Key? key}) : super(key: key);

  @override
  State<PrescricaoMedicamento> createState() => _PrescricaoMedicamentoState();
}

class _PrescricaoMedicamentoState extends State<PrescricaoMedicamento> {
  String textButtonDoctor = 'Medico';
  String textButtonPaciente = 'Paciente';

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
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Color(0xff18CDCA), size: 35),
                ),
                Expanded(
                  child: Text(
                    'Prescrição Medicamento',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff1c1c1c),
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )),
          ),
          Positioned(
            top: size.height * 0.12,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    cursorColor: const Color(0xff1c1c1c),
                    decoration: InputDecoration(
                        labelText: 'Descricão',
                        labelStyle: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff1c1c1c),
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff1c1c1c),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff1c1c1c),
                          ),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            final scaffold = ScaffoldMessenger.of(context);

                            scaffold.clearSnackBars();
                            Medico? dadosMedicos =
                                await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Medicos(),
                              ),
                            );


                            if (dadosMedicos != null) {
                              setState(() {
                                textButtonDoctor = dadosMedicos.NmMedico;
                              });
                            } else {

                              scaffold.clearSnackBars();
                              scaffold.showSnackBar(
                                const SnackBar(
                                  content: Text('Ação cancelada!'),
                                  backgroundColor: Color(0xff18CDCA),
                                ),
                              );
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xff18CDCA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            textButtonDoctor,
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: const Color(0xff1c1c1c),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xff18CDCA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            textButtonPaciente,
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: const Color(0xff1c1c1c),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
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
