// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../../shared/dto/prescription_medical_dto/prescription_medical_dto.dart';
import '../../../shared/dto/prescription_medical_dto/prescription_medicaments_dto.dart';
import '../../../shared/models/model_doctor.dart';
import '../../../shared/models/model_medicacao.dart';

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

  Pessoa? _PacienteSelect;

  void selectPaciente(Pessoa value) {
    _PacienteSelect = value;
    notifyListeners();
  }

  Pessoa? get getPacienteSelect => _PacienteSelect;

  //#endregion

  //#region String Description Medical

  String _descriptionMedical = "";

  String get getDescriptionMedical => _descriptionMedical;

  set setDescriptionMedical(String value) {
    _descriptionMedical = value;
  }

  //#endregion

  DateTime? _criadoEm = DateTime.now();

  //DateTime? get getCriandoEm => _criadoEm;
  //set setCriadoEm(DateTime value) => _criadoEm = value;

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


  void tempo() {}

  void disposeNoNotifier() {
    _selectMedicineOption = false;
    _selectDoctorOption = false;
    _selectPacienteOption = false;
    _medicineSelect = null;
    _PacienteSelect = null;
    _medicoSelect = null;
  }
}
