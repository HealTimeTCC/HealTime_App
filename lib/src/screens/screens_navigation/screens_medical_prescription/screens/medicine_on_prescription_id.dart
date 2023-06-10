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

class ListMedicinesOnPrescription extends StatefulWidget {
  const ListMedicinesOnPrescription({
    Key? key,
    required this.idPrescription,
  }) : super(key: key);
  final int idPrescription;

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
    final Size size = MediaQuery
        .of(context)
        .size;
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
                        Text(
                          'Medicações associadas (cód: ${widget
                              .idPrescription})',
                          style: FontGoogle.textTitleGoogle(size: size * .8),
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
                          return Expanded(
                            child: Column(
                              children: [
                                Center(
                                  child: Lottie.asset(
                                    'assets/json/notfound.json',
                                    height: size.height * .8,
                                  ),
                                ),
                                Text(
                                  "Nada encontrado",
                                  style:
                                  FontGoogle.textSubTitleGoogle(size: size),
                                ),
                              ],
                            ),
                          );
                        case TypeStateRequest.success:
                          return ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            itemCount: value.getListPrescriptionMedicine.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: size.height * .22,
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
                                        size.height * .02)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          value
                                              .getListPrescriptionMedicine[
                                          index]
                                              .medicacao
                                              .nomeMedicacao,
                                          style: FontGoogle.textSubTitleGoogle(
                                            size: size * .5,
                                          ),
                                        ),
                                      ],
                                    ),

                                    if (!value
                                        .getListPrescriptionMedicine[index]
                                        .horariosDefinidos) ...[
                                      Bounceable(
                                        onTap: () async {
                                          await value.gerarHorarios(
                                            context: context,
                                            prescricaoMedicamentoId: value
                                                .getListPrescriptionMedicine[index]
                                                .prescricaoMedicacaoId,
                                            medicamentoId: value
                                                .getListPrescriptionMedicine[index]
                                                .medicacaoId,
                                            prescricaoPatientId: widget
                                                .idPrescription,
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
                                                    vertical: size.height *
                                                        .01),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                      0xff18CDCA),
                                                  borderRadius: BorderRadius
                                                      .only(
                                                    bottomLeft: Radius.circular(
                                                        size.height * .02),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Icon(
                                                      Icons.alarm_add,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "Gerar horários",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ] else
                                      ...[
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: size.height *
                                                        .01),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                      0xffFFCC8C),
                                                  borderRadius: BorderRadius
                                                      .only(
                                                    bottomRight: Radius
                                                        .circular(
                                                        size.height * .02),
                                                  ),
                                                ),
                                                child: Bounceable(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ListProgressMedication(
                                                                codPrescription: value.getListPrescriptionMedicine[index].prescricaoPacienteId
                                                                , codMedicine: value.getListPrescriptionMedicine[index].medicacaoId),),);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                      ],
                                  ],
                                ),
                              );
                            },
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
