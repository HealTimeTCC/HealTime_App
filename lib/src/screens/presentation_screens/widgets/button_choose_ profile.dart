import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile_presentation_screen.dart';

class EscolherPerfil {
  static ElevatedButton botaoEscolha(
      {required Color backgroundButton,
      required String textButton,
      required Color colorFontText,
      required int typeNavigator,
      required BuildContext context}) {
    return ElevatedButton(
      onPressed: () {
        _checkNavigator(context: context, type: typeNavigator);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundButton,
        padding: const EdgeInsets.all(16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      child: Text(
        textButton,
        style: GoogleFonts.getFont('Poppins',
            decoration: TextDecoration.none,
            color: colorFontText,
            fontSize: 16),
      ),
    );
  }

  static void _checkNavigator(
      {required int type, required BuildContext context}) {
    switch (type) {
      case 1:
        {
          String mensagem =
              'Você escolheu um perfil do tipo cuidador! '
              'Nele você será responsavel pelo cuidador de outra pessoa!';

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TelaPerfis(
                  enderecoImagem: 'assets/img/imagemCuidador.png',
                  mensagemSuperior: mensagem,
                  typeUser: 1),
            ),
          );
        }
        break;
      case 2:
        {
          String mensagem = 'Você escolheu um perfil do tipo paciente autonomo! '
              'Onde você mesmo irá  gerenciar seus medicamentos!';

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TelaPerfis(
                  enderecoImagem: 'assets/img/ImagemPaciente.png',
                  mensagemSuperior: mensagem,
                  typeUser: 2),
            ),
          );
        }
        break;
      default:
        {
          String mensagem = 'Você escolheu um perfil do tipo responsável! '
              'Nele você será a ponte entre o cuidador e o paciente!';

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TelaPerfis(
                  enderecoImagem: 'assets/img/ImagemResponsavel.png',
                  mensagemSuperior: mensagem,
                  typeUser: 3),
            ),
          );
        }
    }
  }
}
