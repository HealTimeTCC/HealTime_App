import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../../../../shared/decorations/fonts_google.dart';

class PatientOption extends StatefulWidget {
  const PatientOption({
    Key? key,
    required this.selectPatient,
    this.dadoPaciente,
  }) : super(key: key);
  final bool selectPatient;
  final Pessoa? dadoPaciente;

  @override
  State<PatientOption> createState() => _PatientOptionState();
}

class _PatientOptionState extends State<PatientOption> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (widget.selectPatient) {
      return Container(
        width: size.width * .95,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(size.height * .5)),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Codigo paciente"),
            Text("Código responsavel"),
            Text("Data de nascimento")
          ],
        ),
      );
    } else {
      return Container(
        width: size.width * .95,
        height: size.height * .09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.height * .5)),
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selecione o paciente",
                  style: FontGoogle.textNormaleGoogle(
                    size: size * .7,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      );
    }
  }
}
