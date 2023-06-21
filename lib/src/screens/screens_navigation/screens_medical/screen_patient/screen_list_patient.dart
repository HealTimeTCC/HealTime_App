import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/api/api_patient.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

class ListaPaciente extends StatefulWidget {
  ListaPaciente({
    Key? key,
    required this.personId,
  }) : super(key: key);

  final int personId;

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
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xff1AE8E4),
                  ),
                ),
                SizedBox(),
                Text(
                  'Cadastrar paciente',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.getFont('Poppins',
                      decoration: TextDecoration.none,
                      color: const Color(0xff1c1c1c),
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            // FutureBuilder<List<Pessoa>?>(
            //   future: ApiPaciente.getPatient(personId),
            //   builder: (context, snapshot) {
            //     switch (snapshot.connectionState) {
            //       case ConnectionState.waiting:
            //       case ConnectionState.none:
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );

            //       default:
            //         List<Pessoa> listPessoa = snapshot.data ?? [];

            //         return ListView.builder(
            //           itemCount: listPessoa.length,
            //           itemBuilder: (context, index) {
            //             Pessoa paciente = snapshot.data![index];
            //             return GestureDetector(
            //               onTap: () {
            //                 setState(() {});
            //               },
            //               child: Card(
            //                 color: const Color.fromARGB(229, 206, 206, 206),
            //                 margin: const EdgeInsets.all(12),
            //                 child: ListTile(
            //                   title: Text(paciente.nomePessoa.toString() +
            //                       paciente.sobreNomePessoa.toString()),
            //                   subtitle: Text(paciente.cpfPessoa.toString()),
            //                 ),
            //               ),
            //             );
            //           },
            //         );
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
