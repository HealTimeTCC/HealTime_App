import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_patient.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

class ListaPaciente extends StatefulWidget {
  ListaPaciente({super.key});

  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerScreenListPatient =
      GlobalKey<ScaffoldMessengerState>();

  @override
  State<ListaPaciente> createState() => _ListaPacienteState();
}

class _ListaPacienteState extends State<ListaPaciente> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: ListaPaciente.scaffoldMessengerScreenListPatient,
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundPage(),
            FutureBuilder<List<Pessoa>>(
              future: ApiPaciente.listarPaciente(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  default:
                    List<Pessoa> listPessoa = snapshot.data ?? [];

                    return ListView.builder(
                      itemCount: listPessoa.length,
                      itemBuilder: (context, index) {
                        Pessoa paciente = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Card(
                              color: const Color.fromARGB(229, 206, 206, 206),
                              margin: const EdgeInsets.all(12),
                              child: ListTile(
                                title: Text(paciente.nomePessoa.toString() +
                                    paciente.sobreNomePessoa.toString()),
                                subtitle: Text(paciente.cpfPessoa.toString()),
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
      ),
    );
  }
}
