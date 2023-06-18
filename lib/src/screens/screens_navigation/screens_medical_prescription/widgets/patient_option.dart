import 'package:flutter/material.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';

class PatientOption extends StatefulWidget {
  const PatientOption({
    Key? key,
    required this.selectPatient,
  }) : super(key: key);
  final bool selectPatient;

  @override
  State<PatientOption> createState() => _PatientOptionState();
}

class _PatientOptionState extends State<PatientOption> {
  late ProviderPrescriptionMedical providerPrescriptionMedical =
      Provider.of(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final Pessoa? pessoa = providerPrescriptionMedical.getPacienteSelect;
    final Size size = MediaQuery.of(context).size;
    if (widget.selectPatient) {
      return Container(
        width: size.width * .95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            size.width * .02,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(1, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pessoa?.nomePessoa ?? "Erro ao obter nome",
                    style: FontGoogle.textNormalGreyGoogle(
                      size: pessoa?.nomePessoa == null ? size * .6 : size * .7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Cód: ${pessoa?.pessoaId ?? "Erro ao obter cód"}",
                    style: FontGoogle.textNormalGreyGoogle(
                      size: pessoa?.pessoaId == null ? size * .6 : size * .7,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Data Nasc',
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    pessoa?.dtNascPessoa == null
                        ? "Falha ao obter Data"
                        : DateFormat("dd/MM/yyyy").format(pessoa!.dtNascPessoa),
                    style: FontGoogle.textNormalGreyGoogle(
                      size:
                          pessoa?.dtNascPessoa == null ? size * .6 : size * .7,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.arrow_forward_ios, size: size.width * 0.05),
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: size.width * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            size.width * .02,
          ),
          border: Border.all(
            color: const Color(0xff706F6F),
          ),
          color: Colors.white,
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
                    colorText: Colors.grey.shade500,
                    fontWeightStyle: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.arrow_forward_ios, size: size.width * 0.05),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
