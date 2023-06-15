// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:healtime/services/provider/provider_user.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/models/enuns/enum_type_operation.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:provider/provider.dart';

import '../../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../../screens_medical/screen_medicine/screen_list_medicine.dart';
import '../../screens_medical/screen_patient/select_pacient/screen_select_patient.dart';
import '../logic_options/medical_prescription_logic.dart';
import '../widgets/doctor_option.dart';
import '../widgets/medicine_option.dart';
import '../widgets/patient_option.dart';
import 'define_data_prescription.dart';

class IncludePrescriptionMedical extends StatefulWidget {
  const IncludePrescriptionMedical({Key? key}) : super(key: key);

  @override
  State<IncludePrescriptionMedical> createState() =>
      _IncludePrescriptionMedicalState();
}

class _IncludePrescriptionMedicalState
    extends State<IncludePrescriptionMedical> {
  late ProviderPrescriptionMedical providerPrescriptionMedical =
      Provider.of(context);
  late ProviderHomePage providerHomePage = Provider.of(context);
  late TextEditingController descriptionController = TextEditingController();
  String messageError = "";

  @override
  Widget build(BuildContext context) {
    final ProviderPerson providerPerson = Provider.of<ProviderPerson>(context);
    final Size size = MediaQuery.of(context).size;

    if (providerPerson.person == null) {
      return Container();
    }

    final Pessoa person = providerPerson.person!;

    return Scaffold(
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
                        color: const Color(0xff18CDCA), size: size.width * .08),
                  ),
                  SizedBox(width: size.width * .025),
                  Expanded(
                    child: Text(
                      'Incluir Prescrição',
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
          ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.07),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Informações",
                        style: FontGoogle.textTitleGoogle(
                          size: size * .7,
                          colorText: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    if (person.tipoPessoa != 1) ... [
                      Bounceable(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectPatient(
                                typeOperation:
                                TypeOperation.selectIncludePrescription,
                                personId:
                                providerHomePage.getDataPerson?.pessoaId ?? 0,
                              ),
                            ),
                          );
                        },
                        //todo pegar esse true do provider
                        child: PatientOption(
                          selectPatient:
                          providerPrescriptionMedical.getSelectPacienteOption,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                    ],
                    Bounceable(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListarMedico(
                                includePrescricaoMedica: true),
                          ),
                        );
                      },
                      child: DoctorOption(
                        doctorSelect:
                            providerPrescriptionMedical.getSelectDoctorOption,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Bounceable(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListaRemedios(
                              includePrescriptionMedicine: true,
                            ),
                          ),
                        );
                      },
                      child: MedicineOption(
                          selectMedicine: providerPrescriptionMedical
                              .getSelectMedicineOption),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Descrição",
                        style: FontGoogle.textTitleGoogle(
                          size: size * .7,
                          colorText: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.width * .04),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(1, 2),
                          )
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .04),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: null,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          if (person.tipoPessoa == 1) {
            providerPrescriptionMedical.selectPaciente(person);
            providerPrescriptionMedical.updateStatePacienteOption(true);
          }

          if (!providerPrescriptionMedical.getSelectPacienteOption) {
            setState(() {
              messageError = "Selecione um paciente";
            });
          } else if (!providerPrescriptionMedical.getSelectDoctorOption) {
            setState(() {
              messageError = "Selecione um médico";
            });
          } else if (!providerPrescriptionMedical.getSelectMedicineOption) {
            setState(() {
              messageError = "Selecione uma medicação";
            });
          } else if (descriptionController.text.isEmpty) {
            setState(() {
              messageError = "Descrição Obrigatória";
            });
          } else {
            setState(() {
              messageError = "";
            });
            providerPrescriptionMedical.setDescriptionMedical =
                descriptionController.text;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DefineDataPrescription(),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
