import 'package:flutter/material.dart';

import '../../../../../../shared/models/model_doctor.dart';

class ModelDoctorList extends StatelessWidget {
  const ModelDoctorList({Key? key, required this.doctor}) : super(key: key);

  final Medico doctor;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .01),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(doctor.NmMedico)
        ],
      ),
    );
  }
}
