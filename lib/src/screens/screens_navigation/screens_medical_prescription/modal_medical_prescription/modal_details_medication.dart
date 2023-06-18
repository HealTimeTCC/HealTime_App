import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/dto/medicines_on_prescription_dto/medicines_dto.dart';

class ModalDetailsMedicationPrescription extends StatelessWidget {
  const ModalDetailsMedicationPrescription({
    Key? key,
    required this.medicine,
    required this.interavaloString,
    required this.createIn,
  }) : super(key: key);
  final Medicine medicine;
  final String interavaloString;
  final DateTime createIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool medicineGen = medicine.generico.toUpperCase().trim() == 'S';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size.width * .03),
          topRight: Radius.circular(size.width * .03),
        ),
      ),
      height: size.height * .6,
      width: size.width,
      child: Padding(
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
                        medicine.nomeMedicacao,
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
                        color: medicineGen ? Colors.red : Colors.green,
                      ),
                      child: Text(
                        medicineGen ? "Genérico" : "Não genérico",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .7,
                          colorText: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  Row(
                    children: [
                      Text(
                        "Tipo: ",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      Text(
                        medicine.medicationType.classeAplicacao,
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
                        "Composto Ativo: ",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      Text(
                        medicine.compostoAtivoMedicacao,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .015),
                  Row(
                    children: [
                      Text(
                        "Laboratório: ",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      Text(
                        medicine.laboratorioMedicacao,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .015),
                  Row(
                    children: [
                      Text(
                        "Intervalo: ",
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w600,
                        ),
                      ),
                      Text(
                        interavaloString.replaceAll(':', "h").substring(0, 5),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: FontGoogle.textSubTitleGoogle(
                          size: size * .8,
                          fontWeightText: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .1),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Iniciado: ",
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w600,
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy HH:mm').format(createIn),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
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
