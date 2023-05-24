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
        height: size.height * .1,
        width: size.width * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.height * .5)),
          color: Colors.grey.shade100,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    medico?.NmMedico ?? "Erro ao obter nome",
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Cód: ${medico?.MedicoId ?? "Erro ao obter nome"}",
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
                  Text(
                    'CRM',
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    medico == null
                        ? "Falha ao obter CRM"
                        : medico.CrmMedico,
                    style: FontGoogle.textNormalGreyGoogle(
                      size: size * .7,
                      fontWeight: FontWeight.w500,
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
        height: size.height * .1,
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
                  "Selecione o Médico responsável",
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
