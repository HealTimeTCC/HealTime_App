import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_doctor.dart';
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
            future: ApiMedico.obterMedicosAsync(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<Medico> listMedico = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: listMedico.length,
                    itemBuilder: (context, index) {
                      Medico medico = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Card(
                          color: Color.fromARGB(229, 206, 206, 206),
                          margin: EdgeInsets.all(12),
                          child: ListTile(
                            title: Text(
                              medico.NmMedico.toString(),
                            ),
                            subtitle: Text(
                              medico.CrmMedico.toString(),
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
