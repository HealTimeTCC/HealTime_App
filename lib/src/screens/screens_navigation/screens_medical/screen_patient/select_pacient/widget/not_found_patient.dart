import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:lottie/lottie.dart';

class NotFoundPatient extends StatelessWidget {
  const NotFoundPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * .1),
        Lottie.asset('assets/svg/notFound.json'),
        SizedBox(height: size.height * .04),
        Text(
          'Nenhum paciente associado a esse perfil.',
          style: FontGoogle.textTitleGoogle(
            size: size * .7,
            colorText: const Color(0xff333333),
            fontWeightGoogle: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
