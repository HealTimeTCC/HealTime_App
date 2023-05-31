import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

import '../screens_login_register/screen_login_register.dart';

class TelaPerfis extends StatelessWidget {
  const TelaPerfis(
      {Key? key,
      required this.mensagemSuperior,
      required this.typeUser,
      required this.enderecoImagem})
      : super(key: key);

  final String enderecoImagem;
  final String mensagemSuperior;

  /* Tipo de usuário que foi selecionado */
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
                    style: FontGoogle.textNormaleGoogle(
                      size: size * .9,
                      colorText: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height * .015),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    height: size.height * 0.3,
                    width: size.width * 1,
                    child: Image(
                      image: AssetImage(enderecoImagem),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Veja o que você pode fazer nesse perfil',
                    style: FontGoogle.textNormaleGoogle(
                      size: size * .9,
                      colorText: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height * .015),
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
                      acess: typeUser == 2 || typeUser == 1 ? false : true,
                      textAcess: 'Adicionar/Remover cuidador',
                      context: context),
                  editRow(
                      acess: typeUser == 2 || typeUser == 1 ? false : true,
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
          child: Bounceable(
            onTap: () => Navigator.of(context).pop(),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                size: size.width * .1,
                color: const Color(0xff18CDCA),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.02,
          right: size.width * 0.02,
          child: Bounceable(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginRegister(typeUser: typeUser),
              ),
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward,
                size: size.width * .1,
                color: const Color(0xff18CDCA),
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
              ? Icon(
                  Icons.check_circle_rounded,
                  size: size.width * .06,
                  color: const Color(0xff333333),
                )
              : Icon(
                  Icons.cancel,
                  color: Colors.black26,
                  size: size.width * .06,
                ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Expanded(
            child: Text(
              textAcess,
              style: FontGoogle.textNormaleGoogle(
                size: size * .9,
                colorText: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
