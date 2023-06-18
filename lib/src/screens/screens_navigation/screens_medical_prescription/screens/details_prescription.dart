import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import '../../../../../shared/models/enuns/enum_type_screen_medical.dart';
import '../logic_options/enum_type_state.dart';
import 'medicine_on_prescription_id.dart';

class DetailsPrescription extends StatefulWidget {
  const DetailsPrescription({
    Key? key,
    required this.typeOperation,
  }) : super(key: key);
  static GlobalKey<ScaffoldMessengerState> detailsScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final TypeScreenMedical typeOperation;

  @override
  State<DetailsPrescription> createState() => _DetailsPrescriptionState();
}

class _DetailsPrescriptionState extends State<DetailsPrescription> {
  bool search = false;

  @override
  void dispose() {
    super.dispose();
    search = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xff333333),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .04)
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const IncludePrescriptionMedical(),
          ),
        ),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: size.width * .07,
        ),
      ),
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
                      if (widget.typeOperation == TypeScreenMedical.notHomePage)
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
                      SizedBox(width: size.width * .04),
                      Text(
                        'Lista de Prescrições',
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
                      value.listarPrescricoes(
                          context: context,
                          codPaciente: value.getPacienteSelect?.pessoaId ?? 0);
                      search = true;
                    }
                    switch (value.getTypeStateRequest) {
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
                              "Desculpa, não foi possível obter a lista de prescrições.",
                              textAlign: TextAlign.center,
                              style: FontGoogle.textSubTitleGoogle(
                                size: size * .8,
                              ),
                            ),
                          ],
                        );
                      case TypeStateRequest.success:
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          itemCount: value.getPrescriptionInformationResult
                              ?.prescriptionPatient!.length,
                          itemBuilder: (context, index) {
                            return Bounceable(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListMedicinesOnPrescription(
                                      idPrescription: value
                                          .getListPrescriptionPatient[index]
                                          .prescricaoPacienteId,
                                          createIn: value.getListPrescriptionPatient[index].criadoEm,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .06,
                                  vertical: size.height * .015,
                                ),
                                padding: EdgeInsets.all(size.width * .02),
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
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Cód. Prescrição: ${value.getListPrescriptionPatient[index].prescricaoPacienteId}",
                                          style: FontGoogle.textSubTitleGoogle(
                                            size: size * .5,
                                          ),
                                        ),
                                        Text(
                                          "Cód médico: ${value.getListPrescriptionPatient[index].medicoId}",
                                          style: FontGoogle.textSubTitleGoogle(
                                            size: size * .5,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          value
                                              .getListPrescriptionPatient[index]
                                              .descFichaPessoa,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: FontGoogle.textTitleGoogle(
                                              size: size * .7,
                                              fontWeightGoogle:
                                                  FontWeight.w500),
                                        ),
                                        Icon(
                                          value
                                                  .getListPrescriptionPatient[
                                                      index]
                                                  .flagStatusAtivo
                                              ? Icons.open_in_new
                                              : CupertinoIcons.clock_solid,
                                          color: value
                                                  .getListPrescriptionPatient[
                                                      index]
                                                  .flagStatusAtivo
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Emitido em: ${DateFormat("dd/MM/yyyy").format(value.getListPrescriptionPatient[index].emissao)}",
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: FontGoogle.textTitleGoogle(
                                              size: size * .5,
                                              fontWeightGoogle:
                                                  FontWeight.w500),
                                        ),
                                        Text(
                                          "Válido até: ${DateFormat("dd/MM/yyyy").format(value.getListPrescriptionPatient[index].validade)}",
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: FontGoogle.textTitleGoogle(
                                              size: size * .5,
                                              fontWeightGoogle:
                                                  FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
    );
  }
}
