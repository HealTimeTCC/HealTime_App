import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/telas_apresentacao/widgets/botao_escolha_perfil.dart';

class Apresentacao extends StatelessWidget {
  const Apresentacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          color: const Color(0xff18CDCA),
        ),
        const Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Opacity(
              opacity: 0.5,
              child: Image(
                image: AssetImage('assets/img/logoHealTime.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                child: Text(
                  textAlign: TextAlign.center,
                  'Selecione um tipo de perfil',
                  style: GoogleFonts.getFont('Poppins',
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: size.height * 0.2),
              EscolherPerfil.BotaoEscolha(
                  backgroundButton: const Color(0xff1AE8E4),
                  textButton: 'Cuidador',
                  colorFontText: Colors.black,
                  typeNavigator: 1,
                  context: context),
              SizedBox(height: size.height * 0.03),
              EscolherPerfil.BotaoEscolha(
                  backgroundButton: const Color(0xff172331),
                  textButton: 'Paciente',
                  colorFontText: Colors.white,
                  context: context,
                  typeNavigator: 2),
              SizedBox(height: size.height * 0.03),
              EscolherPerfil.BotaoEscolha(
                  backgroundButton: Colors.white,
                  textButton: 'Resposánvel',
                  colorFontText: Colors.black,
                  context: context,
                  typeNavigator: 3)
            ],
          ),
        ),
      ],
    );
  }
}
