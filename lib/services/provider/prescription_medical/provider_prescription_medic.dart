// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../../shared/dto/progress_medicines_archives_dto/medication_progress_dto.dart';
import '../../../shared/dto/medicines_on_prescription_dto/details_prescription.dart';
import '../../../shared/dto/medicines_on_prescription_dto/prescription_medicine_dto.dart';
import '../../../shared/dto/prescription_medical_dto/prescription_medical_dto.dart';
import '../../../shared/dto/prescription_medical_dto/prescription_medicaments_dto.dart';
import '../../../shared/dto/prescriptions_list/prescription_information_result.dart';
import '../../../shared/dto/prescriptions_list/prescription_patient_dto.dart';
import '../../../shared/dto/progress_medicines_archives_dto/progress_medication_information_dto.dart';
import '../../../shared/models/model_doctor.dart';
import '../../../shared/models/model_medicacao.dart';
import '../../../src/screens/screens_navigation/screens_medical_prescription/logic_options/enum_type_state.dart';
import '../../../src/screens/screens_navigation/screens_medical_prescription/screens/medicine_on_prescription_id.dart';
import '../../api/api_medicine_prescription.dart';

class ProviderPrescriptionMedical extends ChangeNotifier {
  //#region Selecionar Medicacao
  bool _selectMedicineOption = false;

  bool get getSelectMedicineOption => _selectMedicineOption;

  void updateStateMedicineOption(bool value) {
    _selectMedicineOption = value;
  }

  ModelMedicacao? _medicineSelect;

  void selectMedicine(ModelMedicacao values) async {
    _medicineSelect = values;
    notifyListeners();
  }

  ModelMedicacao? get getMedicacaoSelect => _medicineSelect;

  //#endregion

  //#region Selecionar medico

  bool _selectDoctorOption = false;

  bool get getSelectDoctorOption => _selectDoctorOption;

  void updateStateDoctorOption(bool value) {
    _selectDoctorOption = value;
  }

  Medico? _medicoSelect;

  void selectMedic(Medico values) {
    _medicoSelect = values;
    notifyListeners();
  }

  Medico? get getMedicoSelect => _medicoSelect;

  //#endregion

  //#region Selecionar Paciente

  bool _selectPacienteOption = false;

  bool get getSelectPacienteOption => _selectPacienteOption;

  void updateStatePacienteOption(bool value) {
    _selectPacienteOption = value;
    notifyListeners();
  }

  Pessoa? _pacienteSelect;

  void selectPaciente(Pessoa value) {
    _pacienteSelect = value;
    notifyListeners();
  }

  Pessoa? get getPacienteSelect => _pacienteSelect;

  //#endregion

  //#region String Description Medical

  String _descriptionMedical = "";

  String get getDescriptionMedical => _descriptionMedical;

  set setDescriptionMedical(String value) {
    _descriptionMedical = value;
  }

  //#endregion

  DateTime? _emissaoEm = DateTime.now();

  DateTime? get getEmissaoEm => _emissaoEm;

  void updateEmissaoEm(DateTime value) {
    _emissaoEm = value;
    notifyListeners();
  }

  DateTime? _validade = DateTime.now();

  DateTime? get getValidade => _validade;

  void updateValidade(DateTime value) {
    _validade = value;
    notifyListeners();
  }

  TimeOfDay _time = TimeOfDay.now();

  TimeOfDay get getTimeOfDay => _time;

  set setTime(TimeOfDay values) => _time = values;

  Future<bool> includePrescription(
      {required num qtdeDosagem,
      required int qtdeDias,
      required BuildContext context}) async {
    try {
      List<PrescriptionMedicaments> prescriptionMedicaments = [
        PrescriptionMedicaments(
            medicacaoId: _medicineSelect!.medicacaoId!,
            qtde: qtdeDosagem,
            intervalo: _time,
            duracao: qtdeDias)
      ];

      PrescriptionMedicalDto prescriptionMedicalDto = PrescriptionMedicalDto(
          medicoId: _medicoSelect!.MedicoId!,
          pacienteId: _pacienteSelect!.pessoaId!,
          emissao: _emissaoEm!,
          validade: _validade!,
          descFichaPessoa: _descriptionMedical,
          prescricoesMedicacoesDto: prescriptionMedicaments);

      return ApiMedicinePrescription.incluirPrescricaoMedica(
          context: context, prescriptionMedical: prescriptionMedicalDto);
    } catch (e) {
      return false;
    }
  }

  void disposeNoNotifier() {
    _selectMedicineOption = false;
    _selectDoctorOption = false;
    _selectPacienteOption = false;
    _medicineSelect = null;
    _pacienteSelect = null;
    _medicoSelect = null;
  }

  //#region Listar Prescrições Pacientes

  TypeStateRequest _typeStateRequest = TypeStateRequest.init;

  TypeStateRequest get getTypeStateRequest => _typeStateRequest;

  PrescriptionInformationResult? _prescriptionInformationResult;

  List<PrescriptionPatient> _listPrescriptionPatient = [];

  List<PrescriptionPatient> get getListPrescriptionPatient =>
      _listPrescriptionPatient;

  PrescriptionInformationResult? get getPrescriptionInformationResult =>
      _prescriptionInformationResult;


  Future<void> listarPrescricoes({required BuildContext context, required int codPaciente}) async {
    try {
      _typeStateRequest = TypeStateRequest.awaitCharge;
      notifyListeners();
      _prescriptionInformationResult =
          await ApiMedicinePrescription.listPrescriptionPatient(
        context: context,
        codPrescription: codPaciente,
      );
      if (_prescriptionInformationResult?.status == false ||
          _prescriptionInformationResult == null) {
        _typeStateRequest = TypeStateRequest.fail;
        _prescriptionInformationResult?.prescriptionPatient = [];
      } else {
        _listPrescriptionPatient =
            _prescriptionInformationResult?.prescriptionPatient ?? [];
        _typeStateRequest = TypeStateRequest.success;
      }
      notifyListeners();
    } catch (e) {
      _typeStateRequest = TypeStateRequest.fail;
      _prescriptionInformationResult?.prescriptionPatient = [];
      notifyListeners();
    }
  }

  //#endregion
  //#region Listar Prescricao Medicacao

  TypeStateRequest _typeStateRequestPrescriptionMedicine =
      TypeStateRequest.init;

  TypeStateRequest get getTypeStateRequestPrescriptionMedicine =>
      _typeStateRequestPrescriptionMedicine;

  //DetailsPrescriptionMedicineResult? detailsPrescriptionMedicineResult;

  List<PrescriptionMedicine> _listPrescriptionMedicine = [];

  List<PrescriptionMedicine> get getListPrescriptionMedicine =>
      _listPrescriptionMedicine;

  Future<void> listPrescriptionMedicines( {required BuildContext context, required int codPrescription}) async {
    try {
      late DetailsPrescriptionMedicineResult prescriptionMedicineResult;
      _typeStateRequestPrescriptionMedicine = TypeStateRequest.awaitCharge;
      notifyListeners();
      prescriptionMedicineResult =
          await ApiMedicinePrescription.listPrescriptionMedicine(context: context, codPrescription: codPrescription);
      if (prescriptionMedicineResult.status == false) {
        _typeStateRequestPrescriptionMedicine = TypeStateRequest.fail;
        prescriptionMedicineResult.prescriptionMedicine = [];
      } else {
        _listPrescriptionMedicine =
            prescriptionMedicineResult.prescriptionMedicine ?? [];
        _typeStateRequestPrescriptionMedicine = TypeStateRequest.success;
      }
      notifyListeners();
    } catch (e) {
      _typeStateRequestPrescriptionMedicine = TypeStateRequest.fail;
      _listPrescriptionMedicine = [];
      notifyListeners();
    }
  }

 //#endregion
  //#region Gerar Horários
  bool _horariosGerado = false;
  bool get getHorariosGerado => _horariosGerado;

  Future<void> gerarHorarios(
      {required BuildContext context,
      required int prescricaoMedicamentoId,
      required int medicamentoId,
      required int prescricaoPatientId,
      required double sizeText}) async {
    if (await ApiMedicinePrescription.generateSchedules(
        context: context,
        prescricaoPacienteId: prescricaoPatientId,
        prescricaoMedicamentoId: prescricaoMedicamentoId,
        medicamentoId: medicamentoId)) {
      _horariosGerado = true;
      ListMedicinesOnPrescription.medicineOnPrescription.currentState
          ?.showSnackBar(
        SnackBar(
          closeIconColor: Colors.white,
          duration: const Duration(seconds: 5),
          content: Text(
            "Horários gerados",
            style: TextStyle(
              fontSize: sizeText,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      _horariosGerado = false;
      ListMedicinesOnPrescription.medicineOnPrescription.currentState
          ?.showSnackBar(
        SnackBar(
          closeIconColor: Colors.white,
          duration: const Duration(seconds: 5),
          content: Text(
            "Erro ao definir horários",
            style: TextStyle(
              fontSize: sizeText,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  //#endregion


  //#region Listar Andamentos Medicacação


  TypeStateRequest _typeStateRequestProgressMedication = TypeStateRequest.init;

  TypeStateRequest get getTypeStateRequestProgressMedication =>
      _typeStateRequestProgressMedication;


  List<MedicationProgressDto> _listMedicationProgressDto = [];
  List<MedicationProgressDto> get getMedicationProgressDto => _listMedicationProgressDto;

  Future<void> listProgressMedication( {
    required BuildContext context
    , required int codPrescription
    , required int codMedicine }) async {
    try {
      late ProgressMedicationInformationDto progressMedicationInformationDto;
      _typeStateRequestProgressMedication = TypeStateRequest.awaitCharge;
      notifyListeners();
      progressMedicationInformationDto = await ApiMedicinePrescription.listProgressMedication(
          context: context
          , codPrescription: codPrescription
          , codMedicine: codMedicine
      );
      if (progressMedicationInformationDto.status == false) {
        _typeStateRequestProgressMedication = TypeStateRequest.fail;
        progressMedicationInformationDto.listMedicationProgressDto = [];
      } else {
        _listMedicationProgressDto = progressMedicationInformationDto.listMedicationProgressDto ?? [];
        _typeStateRequestProgressMedication = TypeStateRequest.success;
      }
      notifyListeners();
    } catch (e) {
      _typeStateRequestProgressMedication = TypeStateRequest.fail;
      _listMedicationProgressDto = [];
      notifyListeners();
    }
  }
  //#endregion
}
