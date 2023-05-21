import 'package:flutter/material.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/models/model_medicacao.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';

class MedicineOption extends StatefulWidget {
  const MedicineOption({
    Key? key,
    required this.selectMedicine,
  }) : super(key: key);

  final bool selectMedicine;

  @override
  State<MedicineOption> createState() => _MedicineOptionState();
}

class _MedicineOptionState extends State<MedicineOption> {
  late ProviderPrescriptionMedical providerPrescriptionMedical;

  @override
  void dispose(){
    super.dispose();
    providerPrescriptionMedical.disposeNoNotifier();
  }
  @override
  Widget build(BuildContext context) {
    providerPrescriptionMedical = Provider.of(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    if (widget.selectMedicine) {
      ModelMedicacao? medicamento = providerPrescriptionMedical.getMedicacaoSelect;
      return Container(
        width: size.width * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.height * .5)),
          color: Colors.grey.shade100,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  medicamento?.nomeMedicacao ?? "Erro ao obter nome",
                  style: FontGoogle.textNormalGreyGoogle(
                    size: size * .7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Id: ${medicamento?.medicacaoId ?? "Erro ao obter id"}",
                  style: FontGoogle.textNormalGreyGoogle(
                    size: size * .7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('CompostoAtivo',
                    style: FontGoogle.textNormalGreyGoogle(size: size * .6)),
                Text(
                  medicamento == null ? "Falha ao obter composto" : medicamento.compostoAtivoMedicacao,
                  style: FontGoogle.textNormalGreyGoogle(
                    size: size * .7,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: size.height * .09,
        width: size.width * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.height * .5)),
          color: Colors.grey.shade100,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Selecione o medicamento",
              style: FontGoogle.textNormaleGoogle(
                size: size * .7,
              ),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      );
    }
  }
}
