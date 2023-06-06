import 'package:flutter/material.dart';

import '../decorations/fonts_google.dart';

class LoadingQueries extends StatelessWidget {
  const LoadingQueries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            color: Color(0xff18CDCA),
          ),
          SizedBox(height: size.height * .05),
          Text(
            'Carregando...',
            style: FontGoogle.textNormaleGoogle(size: size),
          )
        ],
      ),
    );
  }
}
