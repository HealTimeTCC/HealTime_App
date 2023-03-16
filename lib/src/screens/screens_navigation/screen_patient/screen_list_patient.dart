import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_patient.dart';
import 'package:healtime/shared/background/screen_background.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../../../../services/api/api_patient.dart';

class ListaPaciente extends StatefulWidget {
  ListaPaciente({super.key});

  @override
  State<ListaPaciente> createState() => _ListaPacienteState();
}

class _ListaPacienteState extends State<ListaPaciente> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const BackgroundPage(),
          FutureBuilder<List<Pessoa>>(
            future: ApiPaciente.listarPaciente(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Pessoa paciente = snapshot.data![index];
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            
                          });
                        },
                        child: Card(
                          color: Color.fromARGB(229, 206, 206, 206),
                          margin: EdgeInsets.all(12),
                          child: ListTile(
                            title: Text(paciente.nomePessoa.toString() +
                                paciente.sobreNomePessoa.toString()),
                            subtitle: Text(paciente.cpfPessoa.toString()),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(
                    child: AlertDialog(
                  title: Text('Aviso!'),
                  content: Text('Erro: Pacientes não encontrados'),
                ));
              }
            }
          )
        ],
      ),
    );
  }
}
