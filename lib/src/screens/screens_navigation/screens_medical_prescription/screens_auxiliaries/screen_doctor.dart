import 'package:flutter/material.dart';
import 'package:healtime/shared/background/screen_background.dart';
import 'package:healtime/shared/models/model_doctor.dart';

import '../../../../../services/api/api_doctor.dart';


class Medicos extends StatelessWidget {
  const Medicos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackgroundPage(),
        FutureBuilder<List<Medico>>(
          future: ApiMedico.obterMedicosAsync(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                List<Medico> listMedicos = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: listMedicos.isEmpty ? 0 : listMedicos.length,
                  itemBuilder: (context, index) {
                    Medico medico = snapshot.data![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(medico);
                      },
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(medico.MedicoId.toString()),
                            Row(
                              children: [
                                Text(medico.NmMedico)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ],
    ));
  }
}
