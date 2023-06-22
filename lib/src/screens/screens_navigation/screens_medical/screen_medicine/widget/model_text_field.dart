import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

class ModelTextField extends StatelessWidget {
  const ModelTextField({Key? key, required this.textFieldController})
      : super(key: key);

  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin:
          EdgeInsets.only(bottom: size.height * .02, top: size.height * .005),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff333333), width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: const [
          BoxShadow(blurRadius: 1, offset: Offset(1, 2), color: Colors.black12)
        ],
      ),
      child: TextField(
        controller: textFieldController,
        style: FontGoogle.textNormaleGoogle(size: size),
        cursorColor: Colors.black12,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                left: size.width * .04,
                bottom: size.height * .01,
                top: size.height * .01),
            isCollapsed: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
