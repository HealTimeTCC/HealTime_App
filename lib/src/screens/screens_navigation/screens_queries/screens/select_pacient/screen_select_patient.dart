import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

import '../../../../../../services/api/api_queries.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import '../../../../../../shared/models/model_pessoa.dart';
import '../list_queries/screen_list_queries.dart';

class SelectPatient extends StatelessWidget {
  const SelectPatient({Key? key, required this.personId}) : super(key: key);
  final int personId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          FutureBuilder<List<Pessoa>?>(
            future: ApiQueries.getPatient(personId),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return Container();
                  }
                default:
                  {
                    List<Pessoa> listPatient = snapshot.data ?? [];
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .02),
                        child: Column(
                          children: [
                            SizedBox(height: size.height * .01),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Color(0xff1AE8E4),
                                  ),
                                ),
                                SizedBox(width: size.width * .03),
                                Text(
                                  'Selecione o paciente',
                                  style: FontGoogle.textTitleGoogle(
                                      size: size * .8),
                                )
                              ],
                            ),
                            SizedBox(height: size.height * .02),


                            Flexible(
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()
                                ),
                                itemCount: listPatient.length,
                                itemBuilder: (context, index) {
                                  Pessoa patient = listPatient[index];

                                  return GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ListQueries(pessoa: patient),
                                            ),
                                          ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: size.width * .1),
                                            padding: EdgeInsets.symmetric(
                                                vertical: size.height * .01,
                                                horizontal: size.width * .03),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  patient.cpfPessoa,
                                                  textAlign: TextAlign.right,
                                                  style: FontGoogle.textNormaleGoogle(
                                                      size: size * .75),
                                                ),
                                                const Divider(color: Colors.white),
                                                Text(
                                                  '${patient.nomePessoa} ${patient.sobreNomePessoa}',
                                                  style: FontGoogle.textNormaleGoogle(
                                                      size: size * .8),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
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
    );
  }
}
