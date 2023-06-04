import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../../shared/decorations/fonts_google.dart';
import '../../../../shared/models/enuns/enum_tipo_pessoa.dart';
import '../profile_presentation_screen.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({
    Key? key,
    required this.patchImage,
    required this.subTitleCard,
    required this.titleCard,
    required this.typeProfile,
    required this.colorBackgroundCard,
  }) : super(key: key);

  final String titleCard;
  final String subTitleCard;
  final String patchImage;
  final int typeProfile;
  final Color colorBackgroundCard;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .75,
      decoration: BoxDecoration(
        color: colorBackgroundCard,
        borderRadius: BorderRadius.circular(size.width * .06),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * .02),
                  Image.asset(
                    patchImage,
                    height: size.height * .3,
                  ),
                  Text(
                    titleCard,
                    style: FontGoogle.textTitleGoogle(
                        size: size,
                        colorText: const Color(0xff424242),
                        fontWeightGoogle: FontWeight.w600),
                  ),
                  SizedBox(height: size.height * .01),
                  Text(
                    subTitleCard,
                    style: FontGoogle.textSubTitleGoogle(
                      size: size * .85,
                      colorText: const Color(0xff424242),
                      fontWeightText: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Bounceable(
              onTap: () => _checkNavigator(context: context, type: typeProfile),
              child: Container(
                width: size.width * .63,
                margin: EdgeInsets.symmetric(vertical: size.height * .02),
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .015,
                  horizontal: size.width * .04,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * .02),
                  color: const Color(0xffFFFFFF),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Escolher este perfil',
                      style: FontGoogle.textNormaleGoogle(size: size * .8),
                    ),
                    SizedBox(width: size.width * .01),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: size.width * .05,
                      color: const Color(0xffFF930E),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static void _checkNavigator({
    required int type,
    required BuildContext context,
  }) {
    switch (type) {
      case 1:
        {
          String mensagem = 'Você escolheu um perfil do tipo cuidador! '
              'Nele você será responsavel pelo cuidador de outra pessoa!';

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TelaPerfis(
                  enderecoImagem:
                      'assets/img/Health-professional-team-cuate2.png',
                  mensagemSuperior: mensagem,
                  typeUser: TipoPessoa.cuidador.index),
            ),
          );
        }
        break;
      case 2:
        {
          String mensagem =
              'Você escolheu um perfil do tipo paciente autonomo! '
              'Onde você mesmo irá  gerenciar seus medicamentos!';

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TelaPerfis(
                  enderecoImagem: 'assets/img/Diabetes-cuate2.png',
                  mensagemSuperior: mensagem,
                  typeUser: TipoPessoa.paciente.index),
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
                  enderecoImagem: 'assets/img/Remedy-cuate2.png',
                  mensagemSuperior: mensagem,
                  typeUser: TipoPessoa.responsavel.index),
            ),
          );
        }
    }
  }
}
