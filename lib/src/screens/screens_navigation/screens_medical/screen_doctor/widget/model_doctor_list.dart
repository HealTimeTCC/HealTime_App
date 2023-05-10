import 'package:flutter/material.dart';

import '../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../shared/models/model_doctor.dart';

class ModelDoctorList extends StatelessWidget {
  const ModelDoctorList({Key? key, required this.doctor}) : super(key: key);

  final Medico doctor;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const Radius borderRadius = Radius.circular(10);

    return Container(
      height: size.height * .05,
      margin: EdgeInsets.only(
          left: size.width * .06,
          right: size.width * .06,
          bottom: size.height * .01),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: borderRadius, topRight: borderRadius),
      ),
      child: Row(
        children: [
          Container(
            width: size.width * .02,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff1AE8E4),
              borderRadius: BorderRadius.only(
                  topLeft: borderRadius, bottomLeft: borderRadius),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * .025),
              height: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  doctor.NmMedico,
                  style: FontGoogle.textNormaleGoogle(size: size * .9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
