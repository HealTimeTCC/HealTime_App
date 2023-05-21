import 'package:flutter/material.dart';

import '../../../shared/dto/prescription_medical_dto/prescription_medical_dto.dart';
import '../../../shared/models/model_doctor.dart';
import '../../../shared/models/model_medicacao.dart';

class ProviderPrescriptionMedical extends ChangeNotifier{
  ModelMedicacao? _medicineSelect;
  set setMedicacaoSelect(ModelMedicacao values){
    _medicineSelect = values;
  }
  ModelMedicacao? get getMedicacaoSelect => _medicineSelect;

  Medico? _medicoSelect;
  set setMedicoSelect(Medico values){
    _medicoSelect = values;
  }
  Medico? get getMedicoSelect => _medicoSelect;


  PrescriptionMedicalDto? _prescriptionMedical;
  PrescriptionMedicalDto? get _getPrescriptionMedical => _getPrescriptionMedical;
}