// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical_prescription/screens/screen_list_progress_medication.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/prescription_medical/provider_prescription_medic.dart';
import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import '../logic_options/enum_type_state.dart';
import '../modal_medical_prescription/modal_details_medication.dart';

class ListMedicinesOnPrescription extends StatefulWidget {
  const ListMedicinesOnPrescription({
    Key? key,
    required this.idPrescription,
    required this.createIn,
  }) : super(key: key);
  final int idPrescription;
  final DateTime createIn;

  static GlobalKey<ScaffoldMessengerState> medicineOnPrescription =
      GlobalKey<ScaffoldMessengerState>();

  @override
  State<ListMedicinesOnPrescription> createState() =>
      _ListMedicinesOnPrescriptionState();
}

class _ListMedicinesOnPrescriptionState
    extends State<ListMedicinesOnPrescription> {
  bool search = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: ListMedicinesOnPrescription.medicineOnPrescription,
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundPage(),
            Column(
              children: [
                SafeArea(
                  child: SizedBox(
                    height: size.height * .08,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Color(0xff1AE8E4),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * .03),
                        Text(
                          'Medicações (cód: ${widget.idPrescription})',
                          overflow: TextOverflow.ellipsis,
                          style: FontGoogle.textTitleGoogle(
                            size: size * .8,
                            fontWeightGoogle: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<ProviderPrescriptionMedical>(
                    builder: (context, value, child) {
                      if (!search) {
                        value.listPrescriptionMedicines(
                            context: context,
                            codPrescription: widget.idPrescription);
                        search = true;
                      }
                      switch (value.getTypeStateRequestPrescriptionMedicine) {
                        case TypeStateRequest.init:
                          return Container();
                        case TypeStateRequest.awaitCharge:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case TypeStateRequest.fail:
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              Lottie.asset(
                                'assets/json/notfound.json',
                              ),
                              Text(
                                "Não foi encontrado nenhum medicamento associado a prescrição",
                                textAlign: TextAlign.center,
                                style:
                                    FontGoogle.textSubTitleGoogle(size: size),
                              ),
                            ],
                          );
                        case TypeStateRequest.success:
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: size.width * .06,
                              vertical: size.height * .01,
                            ),
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              itemCount: value.getListPrescriptionMedicine.length,
                              itemBuilder: (context, index) {
                                return Bounceable(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return ModalDetailsMedicationPrescription(
                                          medicine: value
                                              .getListPrescriptionMedicine[index]
                                              .medicacao,
                                          interavaloString: value
                                              .getListPrescriptionMedicine[index]
                                              .intervalo,
                                          createIn: widget.createIn,
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: size.width * .02,
                                      left: size.width * .02,
                                      bottom: size.width * .02,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1,
                                          offset: Offset(1, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(
                                          size.height * .02),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: size.width * .02,
                                                top: size.height * .02,
                                              ),
                                              child: Text(
                                                value
                                                    .getListPrescriptionMedicine[
                                                        index]
                                                    .medicacao
                                                    .nomeMedicacao,
                                                style:
                                                    FontGoogle.textSubTitleGoogle(
                                                  size: size * .8,
                                                  fontWeightText: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: size.width * .02,
                                                top: size.height * .02,
                                              ),
                                              child: Text(
                                                "Genérico: ${value.getListPrescriptionMedicine[index].medicacao.generico.toUpperCase() == 'S' ? "Sim" : "Não"}",
                                                style:
                                                    FontGoogle.textSubTitleGoogle(
                                                  size: size * .8,
                                                  fontWeightText: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: size.height * .03),
                                        if (!value
                                            .getListPrescriptionMedicine[index]
                                            .horariosDefinidos) ...[
                                          Bounceable(
                                            onTap: () async {
                                              await value.gerarHorarios(
                                                context: context,
                                                prescricaoMedicamentoId: value
                                                    .getListPrescriptionMedicine[
                                                        index]
                                                    .prescricaoMedicacaoId,
                                                medicamentoId: value
                                                    .getListPrescriptionMedicine[
                                                        index]
                                                    .medicacaoId,
                                                prescricaoPatientId:
                                                    widget.idPrescription,
                                                sizeText: size.width * .05,
                                              );
                                              if (value.getHorariosGerado) {
                                                if (context.mounted) {
                                                  await value
                                                      .listPrescriptionMedicines(
                                                          context: context,
                                                          codPrescription: widget
                                                              .idPrescription);
                                                }
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            size.height * .01),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color(0xff18CDCA),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                size.height *
                                                                    .02),
                                                        bottomRight:
                                                            Radius.circular(
                                                                size.height *
                                                                    .02),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.alarm_add,
                                                          color: Colors.white,
                                                          size: size.width * .06,
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                size.width * .02),
                                                        Text(
                                                          "Gerar horários",
                                                          style: FontGoogle
                                                              .textNormaleGoogle(
                                                            size: size * .8,
                                                            colorText:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ] else ...[
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            size.height * .01),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color(0xffFFCC8C),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius.circular(
                                                                      size.height *
                                                                          .02),
                                                              bottomLeft: Radius
                                                                  .circular(size
                                                                          .height *
                                                                      .02)),
                                                    ),
                                                    child: Bounceable(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => ListProgressMedication(
                                                                codPrescription: value
                                                                    .getListPrescriptionMedicine[
                                                                        index]
                                                                    .prescricaoPacienteId,
                                                                codMedicine: value
                                                                    .getListPrescriptionMedicine[
                                                                        index]
                                                                    .medicacaoId),
                                                          ),
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text(
                                                            "Visualizar andamento",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.check_outlined,
                                                            color: Colors.black,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
