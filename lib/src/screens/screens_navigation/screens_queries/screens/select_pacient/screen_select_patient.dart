import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/select_pacient/widget/model_patient.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff18CDCA),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .02),
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
                                  'Lista de paciente',
                                  style: FontGoogle.textTitleGoogle(
                                      size: size * .8),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * .04),
                            Flexible(
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics()),
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
                                    child: ModelPatient(person: patient),
                                  );
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