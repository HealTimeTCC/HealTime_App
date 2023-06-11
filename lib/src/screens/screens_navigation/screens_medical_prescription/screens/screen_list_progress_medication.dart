import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/prescription_medical/provider_prescription_medic.dart';
import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/decorations/screen_background.dart';
import '../logic_options/enum_type_state.dart';

class ListProgressMedication extends StatefulWidget {
  const ListProgressMedication({
    Key? key
    , required this.codPrescription
    , required this.codMedicine
  }) : super(key: key);
  final int codPrescription;
  final int codMedicine;
  @override
  State<ListProgressMedication> createState() => _ListProgressMedicationState();
  static GlobalKey<ScaffoldMessengerState> progressMedicationKeyScaffold = GlobalKey<ScaffoldMessengerState>();
}

class _ListProgressMedicationState extends State<ListProgressMedication> {
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
                          'Andamentos',
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
                        value.listProgressMedication(
                            context: context
                            , codPrescription: widget.codPrescription
                            , codMedicine: widget.codMedicine
                        );
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
                          if(value.getMedicationProgressDto.isEmpty){
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
                          }else{
                            return ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              itemCount: value.getMedicationProgressDto.length,
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
                                            "${value.getMedicationProgressDto[index].criadoEm}",
                                            style: FontGoogle.textSubTitleGoogle(
                                              size: size * .5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.height * .01),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFFCC8C),
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      size.height * .02),
                                                ),
                                              ),
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
                                        ],
                                      ),
                                    ],
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
