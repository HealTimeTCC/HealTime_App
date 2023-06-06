import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

class QueryPersonNotFound extends StatelessWidget {
  const QueryPersonNotFound({
    Key? key,
    required this.msgUser,
  }) : super(key: key);

  final String msgUser;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * .04,
        horizontal: size.width * .04,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          msgUser,
          textAlign: TextAlign.center,
          style: FontGoogle.textNormaleGoogle(
            size: size * .85,
          ),
        ),
      ),
    );
  }
}
