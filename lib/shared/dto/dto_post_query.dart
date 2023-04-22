import 'package:flutter/material.dart';

import '../models/model_pessoa.dart';

class PostQuery {
  PostQuery(
      {required this.dataPerson,
      required this.doctorId,
      this.flagForwarding,
      required this.reasonConsultation,
      required this.specialtyId});

  Pessoa dataPerson;
  int specialtyId;
  int doctorId;
  int? flagForwarding;
  String reasonConsultation;
}
