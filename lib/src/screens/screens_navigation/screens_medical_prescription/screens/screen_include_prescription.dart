import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/models/enuns/enum_type_operation.dart';
import 'package:provider/provider.dart';

import '../../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../../screens_medical/screen_medicine/screen_list_medicine.dart';
import '../../screens_medical/screen_patient/select_pacient/screen_select_patient.dart';
import '../widgets/doctor_option.dart';
import '../widgets/medicine_option.dart';
import '../widgets/patient_option.dart';

class PrescricaoMedicamento extends StatefulWidget {
  const PrescricaoMedicamento({Key? key}) : super(key: key);

  @override
  State<PrescricaoMedicamento> createState() => _PrescricaoMedicamentoState();
}

class _PrescricaoMedicamentoState extends State<PrescricaoMedicamento> {
  // String textButtonDoctor = 'Medico';
  // String textButtonPaciente = 'Paciente';
  late ProviderPrescriptionMedical providerPrescriptionMedical = Provider.of(
      context);
  late ProviderHomePage providerHomePage = Provider.of(context);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.07),
                child: Column(
                  children: [
                    Text(
                      'Incluir Prescrição',
                      style: FontGoogle.textTitleGoogle(
                        size: size,
                        colorText: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
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
                    Bounceable(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectPatient(
                                    typeOperation: TypeOperation.select,
                                    personId: providerHomePage.getDataPerson?.pessoaId ?? 0,
                                    incluiPrescricaoMedica: true,
                                ),
                          ),
                        );
                      },
                      //todo pegar esse true do provider
                      child: PatientOption(
                        selectPatient: providerPrescriptionMedical.getSelectPacienteOption,
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
                            builder: (context) =>
                            const ListarMedico(
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
                            builder: (context) =>
                            const ListaRemedios(
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
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26)),
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Bounceable(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: size.height * .065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * .5)),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Adicionar",
                            style: FontGoogle.textNormaleGoogle(
                              colorText: Colors.white,
                              size: size * .9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
