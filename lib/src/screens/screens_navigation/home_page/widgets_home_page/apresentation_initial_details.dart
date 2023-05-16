import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/models/enuns/enum_status_code.dart';
import '../../../../../shared/utility/util_format.dart';

class IntialDetails extends StatefulWidget {
  const IntialDetails({Key? key}) : super(key: key);

  @override
  State<IntialDetails> createState() => _IntialDetailsState();
}

class _IntialDetailsState extends State<IntialDetails> {
  bool chargeInitial = true;

  @override
  void dispose() {
    super.dispose();
    chargeInitial = true;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<ProviderHomePage>(
      builder: (context, value, child) {
        if (chargeInitial == true) {
          value.chargeDataPerson(context);
          chargeInitial = false;
        }
        switch (value.getStatusCodeChargeHome) {
          case TypeChargeView.awaitCharge:
            return const Center(
              child: RefreshProgressIndicator(),
            );
          case TypeChargeView.notFound:
            return Text(
              "Nada encontrado",
              style: FontGoogle.textTitleGoogle(size: size),
            );
          case TypeChargeView.notStart:
            return Container();
          case TypeChargeView.badRequest:
            return Text(
              'ERRO',
              style: FontGoogle.textTitleGoogle(size: size),
            );
          case TypeChargeView.success:
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.9,
                      child: Text(
                        "Olá ${value.getDataPerson?.nomePessoa == null ? 'erro' : value.getDataPerson!.nomePessoa}",
                        style: FontGoogle.textNormaleGoogle(
                            size: size, colorText: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //height: size.height * .25,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: size.width * .5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ultima dose aplicada em: ',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    value.getDataLastDosage?.nomePaciente ??
                                        "nenhum",
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF14D8D5),
                                    ),
                                  ),
                                  Text(
                                    value.getDataLastDosage
                                                ?.dateTimelastDosage ==
                                            null
                                        ? 'nenhum'
                                        : '${DateFormat('dd').format(value.getDataLastDosage!.dateTimelastDosage!)} de ${UtilityFormat.capitalizeFirstLetter(DateFormat('MMM', 'pt_BR').format(value.getDataLastDosage!.dateTimelastDosage!))} ',
                                    style: FontGoogle.textSubTitleGoogle(
                                      size: size,
                                      colorText: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    value.getDataLastDosage
                                                ?.dateTimelastDosage ==
                                            null
                                        ? ''
                                        : DateFormat('HH:mm').format(value
                                            .getDataLastDosage!
                                            .dateTimelastDosage!),
                                    style: FontGoogle.textSubTitleGoogle(
                                      size: size,
                                      colorText: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/img/ImagemRemedio.png',
                              width: size.width * .25,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
        }
      },
    );
  }
}
