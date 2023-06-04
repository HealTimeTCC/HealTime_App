// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class PrescriptionMedicaments {
  int medicacaoId;
  num qtde;
  TimeOfDay intervalo;
  int duracao;

  PrescriptionMedicaments({
    required this.medicacaoId,
    required this.qtde,
    required this.intervalo,
    required this.duracao
  });
  Map<String, dynamic> toJson() {
    return {
      'medicacaoId': medicacaoId,
      'qtde': qtde,
      'intervalo': definirHorario(intervalo), // Convert TimeOfDay to string
      'duracao': duracao,
    };
  }

  String definirHorario(TimeOfDay value){
    return value.toString().replaceAll(RegExp(r'[^0-9:]'), '') + ":00";
  }
}