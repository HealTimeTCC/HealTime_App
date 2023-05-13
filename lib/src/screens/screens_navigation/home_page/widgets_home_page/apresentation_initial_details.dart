import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:provider/provider.dart';

import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/models/model_pessoa.dart';

class IntialDetails extends StatefulWidget {
  const IntialDetails({Key? key}) : super(key: key);

  @override
  State<IntialDetails> createState() => _IntialDetailsState();
}

class _IntialDetailsState extends State<IntialDetails> {
  bool chargeInitial = true;

  @override
  void dispose(){
    super.dispose();
    chargeInitial = true;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<ProviderHomePage>(
      builder: (context, value, child) {
        if(chargeInitial == true){
          value.chargeDataPerson();
          chargeInitial = false;
        }
        switch(value.getChargerNotifier){
          case true:
            return const Center(child: RefreshProgressIndicator(),);
          case false:
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  child: Text(
                    "Olá ${value.getDataPerson?.nomePessoa == null ? 'erro' : value.getDataPerson!.nomePessoa }",
                    style: FontGoogle.textNormaleGoogle(
                        size: size, colorText: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //height: size.height * .25,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * .5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paciente 1',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF14D8D5),
                                ),
                              ),
                              Text('Seg [Static]',
                                  style: FontGoogle.textSubTitleGoogle(
                                      size: size, colorText: Colors.black)),
                              Text('Mes, ano',
                                  style: FontGoogle.textSubTitleGoogle(
                                      size: size, colorText: Colors.black)),
                              Text(
                                'Ultima dose sendo aplicada em [Static] ',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/img/ImagemRemedio.png',
                          width: size.width * .25,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        );
        default:
          return Container();
        }
      },
    );
  }
}
