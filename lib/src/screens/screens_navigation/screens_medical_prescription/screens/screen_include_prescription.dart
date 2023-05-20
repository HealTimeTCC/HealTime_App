import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/decorations/screen_background.dart';

import '../../../../../shared/models/model_doctor.dart';
import '../../screens_medical/screen_doctor/screen_list_doctor.dart';

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
          ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      'Incluir Prescrição',
                      style: FontGoogle.textTitleGoogle(
                        size: size,
                        colorText: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Informações",
                        style: FontGoogle.textTitleGoogle(
                          size: size * .7,
                          colorText: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Bounceable(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * .01,
                          horizontal: size.height * .01,
                        ),
                        height: size.height * .09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * .5)),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Selecione o paciente",
                                  style: FontGoogle.textNormaleGoogle(
                                    size: size * .7,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Bounceable(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * .01,
                          horizontal: size.height * .01,
                        ),
                        height: size.height * .09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * .5)),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Selecione o Medico responsável",
                                  style: FontGoogle.textNormaleGoogle(
                                    size: size * .7,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Bounceable(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * .01,
                          horizontal: size.height * .01,
                        ),
                        height: size.height * .09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * .5)),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Selecione o Medicamento",
                                  style: FontGoogle.textNormaleGoogle(
                                    size: size * .7,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Descrição",
                        style: FontGoogle.textTitleGoogle(
                          size: size * .7,
                          colorText: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26)),
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Bounceable(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: size.height * .065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * .5)),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Adicionar",
                            style: FontGoogle.textNormaleGoogle(
                              colorText: Colors.white,
                              size: size * .9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
