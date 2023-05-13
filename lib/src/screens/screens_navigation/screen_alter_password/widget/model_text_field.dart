import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

class ModelTextFieldPasswordAlter extends StatelessWidget {
  ModelTextFieldPasswordAlter(
      {Key? key,
        required this.keyText,
      required this.textDescription,
      required this.textDescriptionController})
      : super(key: key);

  final String textDescription;
  TextEditingController textDescriptionController = TextEditingController();
  final Key keyText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height * .015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(blurRadius: 1, offset: Offset(1, 2), color: Colors.black12)
        ],
      ),
      child: TextFormField(
        key: keyText,
        validator: (text) {
          if (text == null || text.isEmpty) {
            print('Entrou aqui');
            return 'Não foi possível alterar a senha, campos inválidos.';
          }
          return null;
        },
        cursorColor: Colors.black12,
        controller: textDescriptionController,
        style: FontGoogle.textNormaleGoogle(size: size),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: size.width * .03),
            isCollapsed: true,
            hintText: textDescription,
            hintStyle: FontGoogle.textNormalGreyGoogle(size: size * .9),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
