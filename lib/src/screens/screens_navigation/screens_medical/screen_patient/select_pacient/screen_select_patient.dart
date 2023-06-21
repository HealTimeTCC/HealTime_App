// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:healtime/services/api/api_patient.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_patient/select_pacient/widget/model_text_field.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_patient/select_pacient/widget/not_found_patient.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/api/api_queries.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import '../../../../../../shared/models/enuns/enum_type_operation.dart';
import '../../../../../../shared/models/enuns/enum_type_screen_medical.dart';
import '../../../../../../shared/models/model_pessoa.dart';
import '../../../screens_medical_prescription/screens/details_prescription.dart';
import '../../../screens_queries/screens/list_queries/screen_list_queries.dart';
import 'add_patient/screen_add_patient.dart';

class SelectPatient extends StatelessWidget {
  const SelectPatient({
    Key? key,
    required this.personId,
    required this.typeOperation,
    this.mensageAppBar,
  }) : super(key: key);
  final int personId;
  final String? mensageAppBar;
  final TypeOperation typeOperation;

  static GlobalKey<ScaffoldMessengerState> selectPatientScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    late ProviderPrescriptionMedical providerPrescriptionMedical =
        Provider.of(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: selectPatientScaffoldKey,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return typeOperation == TypeOperation.select
                    ? AddPatient(personId: personId)
                    : const IncludePrescriptionMedical();
              },
            ),
          ),
          backgroundColor: const Color(0xff18CDCA),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .04),
          ),
          child: const Icon(Icons.add_rounded, color: Colors.white),
        ),
        body: Stack(
          children: [
            const BackgroundPage(),
            FutureBuilder<List<Pessoa>?>(
              future: ApiPaciente.getPatient(personId),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      return Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircularProgressIndicator(
                              color: Color(0xff333333),
                            ),
                            SizedBox(height: size.height * .02),
                            Text(
                              'Carregando pacientes...',
                              style: FontGoogle.textTitleGoogle(
                                size: size * .8,
                                colorText: const Color(0xff333333),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  default:
                    {
                      final List<Pessoa> listPatient = snapshot.data ?? [];

                      return SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .02),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * .03),
                              Row(
                                children: [
                                  if (typeOperation !=
                                      TypeOperation
                                          .selectDetailsPrescription) ...[
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Color(0xff1AE8E4),
                                      ),
                                    )
                                  ],
                                  SizedBox(width: size.width * .03),
                                  Text(
                                    mensageAppBar ?? 'Lista de paciente',
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .8),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * .03),
                              Flexible(
                                child: ListView.builder(
                                  physics: const AlwaysScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics(),
                                  ),
                                  itemCount: listPatient.isEmpty
                                      ? 1
                                      : listPatient.length,
                                  itemBuilder: (context, index) {
                                    if (listPatient.isEmpty) {
                                      return const NotFoundPatient();
                                    }

                                    Pessoa patient = listPatient[index];
                                    return Bounceable(
                                      onTap: () {
                                        switch (typeOperation) {
                                          case TypeOperation.select:
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ListQueries(
                                                        pessoa: patient),
                                              ),
                                            );
                                            break;
                                          case TypeOperation.view:
                                            null;
                                            break;
                                          case TypeOperation
                                              .selectIncludePrescription:
                                            providerPrescriptionMedical
                                                .selectPaciente(patient);
                                            providerPrescriptionMedical
                                                .updateStatePacienteOption(
                                                    true);
                                            Navigator.pop(context);
                                            break;
                                          case TypeOperation
                                              .selectDetailsPrescription:
                                            providerPrescriptionMedical
                                                .selectPaciente(patient);
                                            providerPrescriptionMedical
                                                .updateStatePacienteOption(
                                                    true);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailsPrescription(
                                                  typeOperation:
                                                      TypeScreenMedical
                                                          .notHomePage,
                                                ),
                                              ),
                                            );
                                            break;
                                        }
                                      },
                                      child: ModelPatient(person: patient),
                                    );
                                    
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
