import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/prescription_medical/provider_prescription_medic.dart';
import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import '../logic_options/enum_type_state.dart';

class ListProgressMedication extends StatefulWidget {
  const ListProgressMedication({
    Key? key,
    required this.codPrescription,
    required this.codMedicine,
  }) : super(key: key);
  final int codPrescription;
  final int codMedicine;

  @override
  State<ListProgressMedication> createState() => _ListProgressMedicationState();
  static GlobalKey<ScaffoldMessengerState> progressMedicationKeyScaffold =
      GlobalKey<ScaffoldMessengerState>();
}

class _ListProgressMedicationState extends State<ListProgressMedication> {
  bool search = false;

  @override
  void dispose() {
    super.dispose();
    search = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: ListProgressMedication.progressMedicationKeyScaffold,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        SizedBox(width: size.width * .02),
                        Text(
                          'Andamento da medicação',
                          style: FontGoogle.textTitleGoogle(
                            size: size * .85,
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
                        value.listProgressMedication(
                            context: context,
                            codPrescription: widget.codPrescription,
                            codMedicine: widget.codMedicine);
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
                                "Não foi possível obter o andamento da medicação.",
                                style:
                                    FontGoogle.textSubTitleGoogle(size: size),
                              ),
                            ],
                          );
                        case TypeStateRequest.success:
                          if (value.getMedicationProgressDto.isEmpty) {
                            return ListView(
                              shrinkWrap: true,
                              children: [
                                Lottie.asset(
                                  'assets/json/notfound.json',
                                ),
                                Text(
                                  "Por aqui está tudo certo!",
                                  style:
                                      FontGoogle.textSubTitleGoogle(size: size),
                                ),
                              ],
                            );
                          } else {
                            return ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics(),
                              ),
                              itemCount: value.getMedicationProgressDto.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.height * .04),
                                  child: Center(
                                    child: Container(
                                      width: size.width * .9,
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
                                          size.height * .02,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: size.height * .02,
                                              horizontal: size.width * .05,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Cód. Medicação: ",
                                                          style: FontGoogle
                                                              .textSubTitleGoogle(
                                                            fontWeightText:
                                                                FontWeight.w600,
                                                            size: size * .85,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${value.getMedicationProgressDto[index].medicacaoId}",
                                                          style: FontGoogle
                                                              .textSubTitleGoogle(
                                                            size: size * .85,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            size.width * .02,
                                                        vertical:
                                                            size.height * .005,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    size.width *
                                                                        .02),
                                                        color: value
                                                                .getMedicationProgressDto[
                                                                    index]
                                                                .baixaAndamentoMedicacao
                                                            ? Colors.greenAccent
                                                            : Colors.redAccent,
                                                      ),
                                                      child: Text(
                                                        value
                                                                .getMedicationProgressDto[
                                                                    index]
                                                                .baixaAndamentoMedicacao
                                                            ? "Fechada"
                                                            : "Pendente",
                                                        style: FontGoogle
                                                            .textSubTitleGoogle(
                                                          size: size * .7,
                                                          colorText:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Quantidade: ",
                                                      style: FontGoogle
                                                          .textSubTitleGoogle(
                                                        fontWeightText:
                                                            FontWeight.w600,
                                                        size: size * .85,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${value.getMedicationProgressDto[index].qtdeMedicao} UN",
                                                      style: FontGoogle
                                                          .textSubTitleGoogle(
                                                        size: size * .85,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: size.height * .03),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Aplicação em: ",
                                                      style: FontGoogle
                                                          .textSubTitleGoogle(
                                                        fontWeightText:
                                                            FontWeight.w600,
                                                        size: size * .85,
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat(
                                                              "dd/MM/yyyy hh:mm")
                                                          .format(
                                                        value
                                                            .getMedicationProgressDto[
                                                                index]
                                                            .mtAndamentoMedicacao,
                                                      ),
                                                      style: FontGoogle
                                                          .textSubTitleGoogle(
                                                        size: size * .85,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Bounceable(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.height * .01),
                                              decoration: BoxDecoration(
                                                color: value
                                                        .getMedicationProgressDto[
                                                            index]
                                                        .baixaAndamentoMedicacao
                                                    ? Colors.greenAccent
                                                    : const Color(0xffFFB963),
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      size.width * .02),
                                                  bottomLeft: Radius.circular(
                                                      size.width * .02),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Finalizar',
                                                    style: FontGoogle
                                                        .textNormaleGoogle(
                                                      size: size * .75,
                                                      colorText: const Color(0xff333333),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: size.width * .01),
                                                  Icon(
                                                    Icons.check_rounded,
                                                    color:
                                                        const Color(0xff333333),
                                                    size: size.width * .07,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
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
