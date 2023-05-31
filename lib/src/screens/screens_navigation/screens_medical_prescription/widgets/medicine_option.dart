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
          color: Colors.white,
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
                    medicamento?.nomeMedicacao ?? "Erro ao obter nome",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Cód: ${medicamento?.medicacaoId ?? "Erro ao obter id"}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .7,
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
                  Text('Composto Ativo',
                    style: FontGoogle.textNormalGreyGoogle(size: size * .7, fontWeight: FontWeight.w700,),),
                  Text(
                    medicamento == null ? "Falha ao obter composto" : medicamento.compostoAtivoMedicacao,
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .7,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.arrow_forward_ios, size: size.width *  0.05),
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: size.width * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.height * .5)),
          color: Colors.grey.shade100,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Medicamento",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontGoogle.textNormaleGoogle(
                    size: size * .7,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.arrow_forward_ios, size: size.width *  0.05),
            ),
          ],
        ),
      );
    }
  }
}
