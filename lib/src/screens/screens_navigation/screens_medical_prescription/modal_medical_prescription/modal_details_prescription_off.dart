import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/dto/prescriptions_list/prescription_patient_dto.dart';

class ModalDetailsPrescriptionOff extends StatelessWidget {
  const ModalDetailsPrescriptionOff({
    Key? key,
    required this.prescriptionMedicine,
    required this.pacienteCapaz,
  }) : super(key: key);
  final PrescriptionPatient prescriptionMedicine;
  final bool pacienteCapaz;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final borderRadius = size.width * .05;
    return Container(
      height: size.height * .6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius))
      ),
      child:  Padding(
        padding: EdgeInsets.all(size.width * .03),
        child: Column(
          children: [
            //#region Linha Superior
            Column(
              children: [
                Container(
                  height: size.height * .009,
                  width: size.width * .2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(size.width * .03)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prescriptionMedicine.descFichaPessoa,
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close_rounded,
                          size: size.width * .07,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.height * .009),
                  color: Colors.grey,
                  height: size.height * .001,
                )
              ],
            ),

            //#endregion
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: size.height * .02),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(size.width * .02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * .02),
                        color: Colors.red,
                      ),
                      child: Text(
                        prescriptionMedicine.flagStatusAtivo ? "Ativo" : "Inativo",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .7,
                          colorText: Colors.white,
                          fontWeightText: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  if(!pacienteCapaz)...[
                    SizedBox(height: size.height * .02),
                    Row(
                      children: [
                        Text(
                          "Cód paciente: ",
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w600,
                          ),
                        ),
                        Text(
                          prescriptionMedicine.pacienteId.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: size.height * .015),
                  Row(
                    children: [
                      Text(
                        "Criado em: ",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      Text(
                         DateFormat("dd/MM/yyyy - HH:mm:ss").format(prescriptionMedicine.criadoEm),
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .015),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Valido até: ",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      Text(
                        DateFormat("dd/MM/yyyy - HH:mm:ss").format(prescriptionMedicine.validade),
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
