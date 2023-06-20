// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/model_medicacao.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/screen_background.dart';
import 'Widget/model_list_medicine.dart';
import 'logic/medicine.dart';

class ListaRemedios extends StatefulWidget {
  const ListaRemedios({Key? key, this.includePrescriptionMedicine});

  final bool? includePrescriptionMedicine;

  @override
  State<ListaRemedios> createState() => _ListaRemediosState();
}

class _ListaRemediosState extends State<ListaRemedios> {
  late ProviderPrescriptionMedical providerPrescriptionMedical;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    providerPrescriptionMedical = Provider.of(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => Navigator.of(context).pushNamed('/IncludeMedicine'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
        ),
        backgroundColor: const Color(0xff333333),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: size.width * .09,
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: const Color(0xff1AE8E4),
        onRefresh: () async => await LogicMedicine.listMedicine(context: context),
        child: FutureBuilder<List<ModelMedicacao>>(
          future: LogicMedicine.listMedicine(context: context),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xff00BCB9),
                        ),
                        Text(
                          'Obtendo medicamentos...',
                          style: FontGoogle.textNormaleGoogle(size: size),
                        )
                      ],
                    ),
                  );
                }
              default:
                {
                  final List<ModelMedicacao> listMedicine = snapshot.data ?? [];
                  return Stack(
                    children: [
                      const BackgroundPage(),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(Icons.arrow_back_ios_new,
                                  color: const Color(0xff18CDCA),
                                  size: size.width * .08),
                            ),
                            SizedBox(width: size.width * .02),
                            Expanded(
                              child: Text(
                                'Lista de medicamentos',
                                style:
                                    FontGoogle.textTitleGoogle(size: size * .9),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (listMedicine.isNotEmpty) ...[
                        Container(
                          margin: EdgeInsets.only(top: size.height * .08),
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            itemCount: listMedicine.length,
                            itemBuilder: (context, index) {
                              ModelMedicacao medicine = listMedicine[index];
                              return widget.includePrescriptionMedicine == null ||
                                      widget.includePrescriptionMedicine == false
                                  ? ModelListMedicine(medicine: medicine)
                                  : Bounceable(
                                      onTap: () {
                                        providerPrescriptionMedical
                                            .selectMedicine(medicine);
                                        providerPrescriptionMedical
                                            .updateStateMedicineOption(true);
                                        Navigator.pop(context);
                                      },
                                      child:
                                          ModelListMedicine(medicine: medicine),
                                    );
                            },
                          ),
                        ),
                      ] else ...[
                        Align(
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Lottie.asset(
                                'assets/svg/notFound.json',
                                width: size.width * .5,
                                height: size.width * .6,
                              ),
                              SizedBox(height: size.height * .02),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Nenhum medicamento encontrado',
                                  style: FontGoogle.textNormaleGoogle(
                                    size: size * .9,
                                    colorText: const Color(0xff333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
