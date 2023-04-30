import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_doctor.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/models/model_doctor.dart';

class ListarMedico extends StatefulWidget {
  const ListarMedico({super.key});

  @override
  State<ListarMedico> createState() => _ListarMedicoState();
}

class _ListarMedicoState extends State<ListarMedico> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/AddDoctor');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
        ),
        foregroundColor: const Color(0xff1AE8E4),
        backgroundColor: const Color(0xff18CDCA),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: size.width * .09,
        ),
      ),
      body: Stack(
        // ignore: prefer_const_literals_to_create_immutables
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

                  return ListView.builder(
                    itemCount: listMedico.length,
                    itemBuilder: (context, index) {
                      Medico doctor = snapshot.data![index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).pop(doctor),
                        child: Card(
                          color: const Color.fromARGB(229, 206, 206, 206),
                          margin: const EdgeInsets.all(12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * .01,
                                      horizontal: size.width * .03),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Socorroe',
                                        textAlign: TextAlign.right,
                                        style: FontGoogle.textNormaleGoogle(
                                            size: size * .7),
                                      ),
                                      const Divider(color: Colors.white),
                                      Text(
                                        'Socorroe',
                                        style: FontGoogle.textNormaleGoogle(
                                            size: size * .9),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
