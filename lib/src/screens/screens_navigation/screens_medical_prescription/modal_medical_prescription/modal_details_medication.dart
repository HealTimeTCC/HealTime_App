import 'package:flutter/material.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/dto/medicines_on_prescription_dto/medicines_dto.dart';

class ModalDetailsMedicationPrescription extends StatelessWidget {
  const ModalDetailsMedicationPrescription({
    Key? key,
    required this.medicine,
    required this.interavaloString
  })
      : super(key: key);
  final Medicine medicine;
  final String interavaloString;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool medicineGen = medicine.generico.toUpperCase().trim() == 'S';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * .03),
            topRight: Radius.circular(size.width * .03)),
      ),
      height: size.height * .6,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                            size: size * .8, fontWeightText: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded))
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * .01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.all(size.width * .03),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width * .02),
                          color: medicineGen ? Colors.green : Colors.red,
                        ),
                        child: Text(
                          medicineGen ? "Genérico" : "Não genérico",
                          style: FontGoogle.textSubTitleGoogle(
                              size: size * .7,
                              colorText: Colors.white
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Tipo: ", style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w700
                        ),
                        ),
                        Text(
                          medicine.medicationType.classeAplicacao,
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Composto Ativo: ", style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w700
                        ),
                        ),
                        Text(
                          medicine.compostoAtivoMedicacao,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Laboratório: ", style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w700
                        ),
                        ),
                        Text(
                          medicine.laboratorioMedicacao,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Intervalo: ", style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                            fontWeightText: FontWeight.w700
                        ),
                        ),
                        Text(
                          interavaloString.replaceAll(':', "h").substring(0,5),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: FontGoogle.textSubTitleGoogle(
                            size: size * .8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
