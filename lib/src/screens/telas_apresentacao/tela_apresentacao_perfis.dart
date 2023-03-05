import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaPerfis extends StatelessWidget {
  const TelaPerfis({Key? key, required this.mensagemSuperior, required this.typeUser})
      : super(key: key);

  final String mensagemSuperior;
  final int typeUser;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          color: const Color(0xff18CDCA),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: size.height * 0.1,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    mensagemSuperior,
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Veja o que você pode fazer nesse perfil',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  editRow(
                      acess: true,
                      textAcess: 'Adicionar/Remover medicamentos',
                      context: context),
                  editRow(
                      acess: true,
                      textAcess: 'Gerenciar suas configurações',
                      context: context),
                  editRow(
                      acess: true,
                      textAcess: 'Gerenciar calendário',
                      context: context),
                  editRow(
                      acess: typeUser == 3 || typeUser == 1 ? false : true,
                      textAcess: 'Adicionar/Remover cuidador',
                      context: context),
                  editRow(
                      acess: typeUser == 3 || typeUser == 1 ? false : true,
                      textAcess: 'Vincular outros pacientes',
                      context: context),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.02,
          left: size.width * 0.02,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                size: 40,
                color: Color(0xff18CDCA),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.02,
          right: size.width * 0.02,
          child: GestureDetector(
            onTap: null,
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward,
                size: 40,
                color: Color(0xff18CDCA),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container editRow(
      {required bool acess,
      required String textAcess,
      required BuildContext context}) {
    final size = MediaQuery.of(context).size;

    final Color colorText = acess ? Colors.white : Colors.white30;

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      child: Row(
        children: [
          acess
              ? const Icon(
                  Icons.check_circle_rounded,
                  size: 25,
                  color: Color(0xff1c1c1c),
                )
              : const Icon(
                  Icons.cancel,
                  color: Colors.black26,
                  size: 25,
                ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Expanded(
            child: Text(
              textAcess,
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: colorText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
