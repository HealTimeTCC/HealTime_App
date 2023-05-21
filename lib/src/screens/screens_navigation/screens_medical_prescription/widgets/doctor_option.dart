import 'package:flutter/material.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/models/model_doctor.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';

class DoctorOption extends StatefulWidget {
  const DoctorOption({
    Key? key,
    required this.doctorSelect,
  }) : super(key: key);
  final bool doctorSelect;

  @override
  State<DoctorOption> createState() => _DoctorOptionState();
}

class _DoctorOptionState extends State<DoctorOption> {
  late ProviderPrescriptionMedical providerPrescriptionMedical;

  @override
  void dispose() {
    super.dispose();
    providerPrescriptionMedical.disposeNoNotifier();
  }

  @override
  Widget build(BuildContext context) {
    providerPrescriptionMedical = Provider.of(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    if (widget.doctorSelect) {
      Medico? medico = providerPrescriptionMedical.getMedicoSelect;
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
                  medico?.NmMedico ?? "Erro ao obter nome",
                  style: FontGoogle.textNormalGreyGoogle(
                    size: size * .7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Id: ${medico?.MedicoId ?? "Erro ao obter nome"}",
                  style: FontGoogle.textNormalGreyGoogle(
                    size: size * .7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('CRM',
                    style: FontGoogle.textNormalGreyGoogle(size: size * .6)),
                Text(
                  medico == null ? "Falha ao obter CRM" : medico.CrmMedico,
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
              "Selecione o Medico responsável",
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
