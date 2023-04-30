import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../../../../services/data_locale/data_preferences_pessoa.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return FutureBuilder<Pessoa?>(
      future: DataPreferencesPessoa.getDataUser(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          default:
            {
              if (snapshot.data == null) return Container();

              Pessoa person = snapshot.data!;

              return Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                height: size.height * .2,
                decoration: BoxDecoration(
                  color: const Color(0xffEBEBEB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width),
                          border: Border.all(
                            color: const Color(0xff6A6A6A),
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffD9D9D9),
                          radius: size.width * .15,
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.person_2_rounded,
                              color: const Color(0xff6A6A6A),
                              size: size.width * .25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '${person.nomePessoa} ${person.sobreNomePessoa}',
                            style:
                                FontGoogle.textNormaleGoogle(size: size * .7),
                          ),
                          SizedBox(height: size.height * .01),
                          Text(
                            person.contact!.email,
                            style:
                                FontGoogle.textNormaleGoogle(size: size * .7),
                          ),
                          SizedBox(height: size.height * .01),
                          Text(
                            'Editar informações',
                            style: FontGoogle.textNormalGreyGoogle(
                                size: size * .65),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
