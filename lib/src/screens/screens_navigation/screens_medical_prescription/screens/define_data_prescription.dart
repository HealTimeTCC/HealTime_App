import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../logic_options/define_dates.dart';

class DefineDataPrescription extends StatefulWidget {
  const DefineDataPrescription({Key? key}) : super(key: key);

  @override
  State<DefineDataPrescription> createState() => _DefineDataPrescriptionState();
}

class _DefineDataPrescriptionState extends State<DefineDataPrescription> {
  //este brinquedo eu uso para chamar a SnackBar caso seja necessário
  static GlobalKey<ScaffoldMessengerState>
      scaffoldMessengerKeyDataPrescription =
      GlobalKey<ScaffoldMessengerState>();
  late ProviderPrescriptionMedical providerPrescriptionMedical;
  TextEditingController controllerQtdeDias = TextEditingController();
  TextEditingController controllerQtdeDosagem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerPrescriptionMedical = Provider.of(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: scaffoldMessengerKeyDataPrescription,
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundPage(),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_ios_new,
                          color: const Color(0xff18CDCA),
                          size: size.width * .08),
                    ),
                    SizedBox(width: size.width * .025),
                    Expanded(
                      child: Text(
                        'Dados da prescrição',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff1c1c1c),
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * .12,
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .05,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Data de emissão:',
                                  style:
                                      FontGoogle.textSubTitleGoogle(size: size),
                                ),
                                SizedBox(height: size.height * .005),
                                GestureDetector(
                                  onTap: () async {
                                    await DefineDatePrescriptionMedical
                                        .selectDate(
                                            context: context,
                                            typeEmissao: true);
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * .05),
                                    height: size.height * .07,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF3F6F8),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xff333333),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            DateFormat('dd/MM/yyyy').format(
                                                providerPrescriptionMedical
                                                    .getEmissaoEm!),
                                            textAlign: TextAlign.left,
                                            style:
                                                FontGoogle.textNormalGreyGoogle(
                                                    size: size),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.calendar_month_rounded,
                                          color: Color(0xff1c1c1c),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  'Data de validade:',
                                  style:
                                      FontGoogle.textSubTitleGoogle(size: size),
                                ),
                                SizedBox(height: size.height * .005),
                                GestureDetector(
                                  onTap: () async {
                                    await DefineDatePrescriptionMedical
                                        .selectDate(
                                            context: context,
                                            typeEmissao: false);
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * .05),
                                    height: size.height * .07,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF3F6F8),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xff333333),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            DateFormat('dd/MM/yyyy').format(
                                                providerPrescriptionMedical
                                                    .getValidade!),
                                            textAlign: TextAlign.left,
                                            style:
                                                FontGoogle.textNormalGreyGoogle(
                                                    size: size),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.calendar_month_rounded,
                                          color: Color(0xff1c1c1c),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Intervalo em horas:',
                                        style: FontGoogle.textSubTitleGoogle(
                                            size: size),
                                      ),
                                      Container(
                                        width: size.width * .3,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(size.height * .5),
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 1,
                                              offset: Offset(2, 2),
                                            )
                                          ],
                                        ),
                                        child: Bounceable(
                                          onTap: () async {
                                            await DefineDatePrescriptionMedical
                                                .selectTime(
                                                    context: context,
                                                    typeEmissao: true);
                                            setState(() {});
                                          },
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            DateFormat('HH:mm').format(
                                              DateTime(
                                                0,
                                                0,
                                                0,
                                                providerPrescriptionMedical
                                                    .getTimeOfDay.hour,
                                                providerPrescriptionMedical
                                                    .getTimeOfDay.minute,
                                              ),
                                            ),
                                            style:
                                                FontGoogle.textNormalGreyGoogle(
                                                    size: size),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quantidade de dias:',
                                        style: FontGoogle.textSubTitleGoogle(
                                            size: size),
                                      ),
                                      Container(
                                        width: size.width * .3,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(size.height * .5),
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 1,
                                              offset: Offset(2, 2),
                                            )
                                          ],
                                        ),
                                        child: TextField(
                                          controller: controllerQtdeDias,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Dosagem por hora:',
                                        style: FontGoogle.textSubTitleGoogle(
                                            size: size),
                                      ),
                                      Container(
                                        width: size.width * .3,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(size.height * .5),
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 1,
                                              offset: Offset(2, 2),
                                            )
                                          ],
                                        ),
                                        child: TextField(
                                          controller: controllerQtdeDosagem,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Bounceable(
                              onTap: () {
                                try{
                                  num? qtdeDias = num.tryParse(controllerQtdeDias.text);
                                }
                                catch(e){

                                }
                              },
                              child: Container(
                                width: size.width * .9,
                                height: size.height * .07,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1AE8E4),
                                    borderRadius:
                                        BorderRadius.circular(size.width * .1)),
                                child: Center(
                                  child: Text(
                                    'Finalizar',
                                    textAlign: TextAlign.center,
                                    style: FontGoogle.textTitleGoogle(
                                      size: size * .9,
                                      colorText: Colors.white,
                                      fontWeightGoogle: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //     right: 0,
            //
            //     child: Bounceable(onTap: () {}, child: Text('data'),
            //     ),
            // )
          ],
        ),
      ),
    );
  }
}
