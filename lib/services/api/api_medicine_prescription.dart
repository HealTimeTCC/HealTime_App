// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/shared/dto/prescription_medical_dto/prescription_medical_dto.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/prescriptions_list/prescription_information_result.dart';
import '../../shared/dto/prescriptions_list/prescription_patient_dto.dart';
import '../provider/login/provider_login.dart';

class ApiMedicinePrescription {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static String obterUri(BuildContext context) {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
    final String uriApi =
        '${providerLogin.addressServer ?? uriApiBase}Medicacoes/';
    return uriApi;
  }

  //#region Incluir prescrição
  static Future<bool> incluirPrescricaoMedica ({
    required BuildContext context,
    required PrescriptionMedicalDto prescriptionMedical,
  }) async {
    //todo testar essa requisição
    try {
      String uriBase = "${obterUri(context)}IncluiPrescricao";
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
  //#endregion
  //#region listar prescrições
  static Future<PrescriptionInformationResult> listPrescriptionPatient ({
    required BuildContext context,
    required int codPaciente,
  }) async {
    //todo testar essa requisição
    try {
      String uriBase = "${obterUri(context)}ListarPrescricoesPacientes";
      var response = await http.get(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
      );
      if(response.statusCode == 200){
        PrescriptionInformationResult prescriptionInformationResult =
        PrescriptionInformationResult(status: true);
        prescriptionInformationResult.prescriptionPatient = jsonDecode(response.body).map((json) => PrescriptionPatient.fromJson(json)).toList();
        return prescriptionInformationResult;
      }
      else{
        PrescriptionInformationResult prescriptionInformationResult = PrescriptionInformationResult(status: false);
        return prescriptionInformationResult;
      }
    } catch (e) {
      PrescriptionInformationResult prescriptionInformationResult = PrescriptionInformationResult(status: false);
      return prescriptionInformationResult;    }
  }
  //#endregion
}
