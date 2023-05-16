import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/widget/custom_field.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_list_medicine.dart';

import '../../home_page/home.dart';

class IncluirMedicamento extends StatefulWidget {
  const IncluirMedicamento({super.key});

  @override
  State<IncluirMedicamento> createState() => _IncluirMedicamentoState();
}

class _IncluirMedicamentoState extends State<IncluirMedicamento> {
  TextEditingController textControllerNomeRemed = TextEditingController();
  TextEditingController textControllerTipo = TextEditingController();
  TextEditingController textControllerVia = TextEditingController();
  TextEditingController textControllerCompostoAtivo = TextEditingController();
  TextEditingController textControllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
        body: Stack(children: [
      const BackgroundPage(),
      // Incluir um modal aqui assim:
      // ATENÇÃO! Para inclur um medicamento tenha a receita médica em mãos, pois você ira precisar
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListaRemedios())),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: const Color(0xff1AE8E4),
                  ),
                ),
                Expanded(
                    child: Text(
                  'Incluir Medicamento',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Poppins',
                      decoration: TextDecoration.none,
                      color: Color(0xff1c1c1c),
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                )),
              ],
            ),
          )),

      Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Container(
              margin: EdgeInsets.all(7),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomField(
                        label: "Nome do medicamento",
                        textController: textControllerNomeRemed,
                        keyboardType: TextInputType.text),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .4,
                          child: CustomField(
                              label: "ex.comprimido",
                              textController: textControllerTipo,
                              keyboardType: TextInputType.text),
                        ),
                        SizedBox(
                          width: 26,
                        ),
                        SizedBox(
                          width: size.width * .4,
                          child: CustomField(
                              label: "Via",
                              textController: textControllerVia,
                              keyboardType: TextInputType.text),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomField(
                        label: "Composto ativo medicação",
                        textController: textControllerCompostoAtivo,
                        keyboardType: TextInputType.text),
                    SizedBox(
                      height: 20,
                    ),
                    CustomField(
                        label: "Descrição",
                        textController: textControllerDescricao,
                        keyboardType: TextInputType.multiline),
                  ],
                ),
              ))),
    ]));
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
