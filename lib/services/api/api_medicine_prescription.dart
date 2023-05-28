// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/shared/dto/prescription_medical_dto/prescription_medical_dto.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../shared/consts/consts_required.dart';
import '../provider/login/provider_login.dart';

class ApiMedicinePrescription {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static String obterUri(BuildContext context) {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
    final String uriApi =
        '${providerLogin.addressServer ?? uriApiBase}Medicacoes/';
    return uriApi;
  }

  static Future<bool> incluirPrescricaoMedica ({
    required BuildContext context,
    required PrescriptionMedicalDto prescriptionMedical,
  }) async {
    //todo testar essa requisição
    try {
      String uriBase = obterUri(context) + "IncluiPrescricao";
      var response = await http.post(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
        body: jsonEncode(prescriptionMedical.toJson()),
      );
      if(response.statusCode == 200){
        return true;
      }
      else{
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
