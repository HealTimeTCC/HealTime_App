// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/api/api_doctor.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/models/model_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/widget/model_doctor_list.dart';
import 'package:provider/provider.dart';

class ListarMedico extends StatefulWidget {
  const ListarMedico({
    Key? key,
    this.includePrescricaoMedica,
  });

  final bool? includePrescricaoMedica;

  @override
  State<ListarMedico> createState() => _ListarMedicoState();
}

class _ListarMedicoState extends State<ListarMedico> {
  late ProviderPrescriptionMedical providerPrescriptionMedical;

  @override
  Widget build(BuildContext context) {
    providerPrescriptionMedical = Provider.of(context);

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/AddDoctor'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
        ),
        backgroundColor: const Color(0xff18CDCA),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: size.width * .09,
        ),
      ),
      body: Stack(
        children: [
          const BackgroundPage(),
          FutureBuilder<List<Medico>>(
            future: ApiMedico.obterMedicosAsync(context),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xff18CDCA),
                        ),
                        SizedBox(height: size.height * .02),
                        Text(
                          'Preparando a lista de médicos, já voltamos!',
                          style:
                              FontGoogle.textSubTitleGoogle(size: size * .85),
                        )
                      ],
                    ),
                  );
                default:
                  List<Medico> listMedico = snapshot.data ?? [];

                  return SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back_ios_new,
                                  color: const Color(0xff18CDCA),
                                  size: size.width * .07),
                            ),
                            SizedBox(width: size.width * .04),
                            Expanded(
                              child: Text(
                                'Lista de Médicos',
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
                        SizedBox(height: size.height * .02),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listMedico.length,
                          itemBuilder: (context, index) {
                            Medico doctor = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                if(widget.includePrescricaoMedica == null || widget.includePrescricaoMedica == false){
                                  Navigator.of(context).pop(doctor);
                                }
                                else{
                                  providerPrescriptionMedical.setMedicoSelect = doctor;
                                  Navigator.of(context).pop();
                                }
                              },
                              child: ModelDoctorList(doctor: doctor),
                            );
                          },
                        ),
                      ],
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
