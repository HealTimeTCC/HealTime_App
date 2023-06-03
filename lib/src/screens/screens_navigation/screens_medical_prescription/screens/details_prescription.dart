import 'package:flutter/material.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import '../logic_options/enum_type_state.dart';

class DetailsPrescription extends StatefulWidget {
  const DetailsPrescription({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldMessengerState> detailsScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  State<DetailsPrescription> createState() => _DetailsPrescriptionState();
}

class _DetailsPrescriptionState extends State<DetailsPrescription> {
  bool search = false;

  @override
  void dispose(){
    super.dispose();
    search = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: DetailsPrescription.detailsScaffoldKey,
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
                          'Lista de Prescrições',
                          style: FontGoogle.textTitleGoogle(size: size * .8),
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<ProviderPrescriptionMedical>(
                  builder: (context, value, child) {
                    if(!search){
                      value.listarPrescricoes(context: context,codPaciente: value.getListPrescriptionPatient.length);
                      search = true;
                    }
                    switch (value.getTypeStateRequest) {
                      case TypeStateRequest.init:
                        return Container();
                      case TypeStateRequest.awaitCharge:
                        return const Center(
                          child: LinearProgressIndicator(),
                        );
                      case TypeStateRequest.fail:
                        return Text("Erro ao obter");
                      case TypeStateRequest.success:
                        return ListView.builder(
                          itemCount: value.getPrescriptionInformationResult?.prescriptionPatient!.length,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
