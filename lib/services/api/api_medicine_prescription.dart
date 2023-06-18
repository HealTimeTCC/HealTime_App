// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/shared/dto/generate_schedules_dto.dart';
import 'package:healtime/shared/dto/prescription_medical_dto/prescription_medical_dto.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/medicines_on_prescription_dto/details_prescription.dart';
import '../../shared/dto/medicines_on_prescription_dto/prescription_medicine_dto.dart';
import '../../shared/dto/prescriptions_list/prescription_information_result.dart';
import '../../shared/dto/prescriptions_list/prescription_patient_dto.dart';
import '../../shared/dto/progress_medicines_archives_dto/medication_progress_dto.dart';
import '../../shared/dto/progress_medicines_archives_dto/progress_medication_information_dto.dart';
import '../../src/screens/screens_navigation/screens_medical_prescription/screens/medicine_on_prescription_id.dart';
import '../../src/screens/screens_navigation/screens_medical_prescription/screens/screen_list_progress_medication.dart';
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
  static Future<bool> incluirPrescricaoMedica({
    required BuildContext context,
    required PrescriptionMedicalDto prescriptionMedical,
  }) async {
    //todo testar essa requisição
    try {
      print(prescriptionMedical.toJson().toString());
      String uriBase = "${obterUri(context)}IncluiPrescricao";
      var response = await http.post(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
        body: jsonEncode(prescriptionMedical.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //#endregion
  //#region listar prescrições Medicacoes by cod Prescription
  static Future<DetailsPrescriptionMedicineResult> listPrescriptionMedicine({
    required BuildContext context,
    required int codPrescription,
  }) async {
    //todo testar essa requisição
    try {
      final String uriBase =
          "${obterUri(context)}ListarPrescricaoMedicacaoByCodPrescricaoPaciente/$codPrescription";
      var response = await http.get(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
      );

      if (response.statusCode == 200) {
        DetailsPrescriptionMedicineResult detailsPrescriptionMedicineResult =
            DetailsPrescriptionMedicineResult(status: true);

        List<dynamic> listDynamic = jsonDecode(response.body) as List<dynamic>;

        List<PrescriptionMedicine> listPrescription = listDynamic
            .map((json) => PrescriptionMedicine.fromJson(json))
            .toList();
        detailsPrescriptionMedicineResult.prescriptionMedicine =
            listPrescription;
        return detailsPrescriptionMedicineResult;
      } else {
        return DetailsPrescriptionMedicineResult(status: false);
      }
    } catch (e) {
      ListMedicinesOnPrescription.medicineOnPrescription.currentState
          ?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          closeIconColor: Colors.white,
          content: Text(
            e.toString(),
          ),
        ),
      );
      return DetailsPrescriptionMedicineResult(status: false);
    }
  }

  //#endregion
  //#region listar prescrições
  static Future<PrescriptionInformationResult> listPrescriptionPatient({
    required BuildContext context,
    required int codPrescription,
  }) async {
    //todo testar essa requisição
    try {
      final String uriBase =
          "${obterUri(context)}ListarPrescricoesPacientes/$codPrescription";
      final http.Response response = await http.get(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
      );

      print(uriBase);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        PrescriptionInformationResult prescriptionInformationResult =
            PrescriptionInformationResult(status: true);

        List<dynamic> listDynamic = jsonDecode(response.body) as List<dynamic>;

        List<PrescriptionPatient> listPrescription = listDynamic
            .map((json) => PrescriptionPatient.fromJson(json))
            .toList();

        prescriptionInformationResult.prescriptionPatient = listPrescription;
        return prescriptionInformationResult;
      } else {
        PrescriptionInformationResult prescriptionInformationResult =
            PrescriptionInformationResult(status: false);
        return prescriptionInformationResult;
      }
    } catch (e) {
      PrescriptionInformationResult prescriptionInformationResult =
          PrescriptionInformationResult(status: false);
      return prescriptionInformationResult;
    }
  }

  //#endregion
  //#region Gerar horarios

  static Future<bool> generateSchedules({
    required BuildContext context,
    required int prescricaoPacienteId,
    required int prescricaoMedicamentoId,
    required int medicamentoId,
  }) async {
    try {
      String uriBase = "${obterUri(context)}GerarHorarios";
      //Objeto a ser enviado
      GenerateSchedules generateSchedules = GenerateSchedules(
        prescricaoPacienteId: prescricaoPacienteId,
        prescricaoMedicamentoId: prescricaoMedicamentoId,
        medicamentoId: medicamentoId,
      );

      var response = await http.post(
        Uri.parse(uriBase),
        body: json.encode(generateSchedules.toJson()),
        headers: await ConstsRequired.headRequisit(),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Erro ${e.toString()}");
    }
  }

  //#endregion
  //#region Listar Andamento Medicacões
  static Future<ProgressMedicationInformationDto> listProgressMedication(
      {required BuildContext context,
      required int codPrescription,
      required int codMedicine}) async {
    try {
      String uriBase =
          "${obterUri(context)}ListarAndamentosMedicacao/$codMedicine/$codPrescription";
      //print("${obterUri(context)}ListarAndamentosMedicacao/$codMedicine/$codPrescription");
      var response = await http.get(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
      );
      if (response.statusCode == 200) {
        ProgressMedicationInformationDto progressMedicationInformationDto =
            ProgressMedicationInformationDto(status: true);

        List<dynamic> listDynamic = jsonDecode(response.body) as List<dynamic>;

        List<MedicationProgressDto> listMedicationProgressDto = listDynamic
            .map((json) => MedicationProgressDto.fromJson(json))
            .toList();

        progressMedicationInformationDto.listMedicationProgressDto =
            listMedicationProgressDto;
        return progressMedicationInformationDto;
      } else {
        ProgressMedicationInformationDto progressMedicationInformationDto =
            ProgressMedicationInformationDto(status: false);
        return progressMedicationInformationDto;
      }
    } catch (e) {
      ListProgressMedication.progressMedicationKeyScaffold.currentState
          ?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          closeIconColor: Colors.white,
          content: Text(
            e.toString(),
          ),
        ),
      );
      ProgressMedicationInformationDto progressMedicationInformationDto =
          ProgressMedicationInformationDto(status: false);
      return progressMedicationInformationDto;
    }
  }

//#endregion
}
