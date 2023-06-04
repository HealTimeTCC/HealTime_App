import 'package:healtime/shared/dto/prescriptions_list/prescription_patient_dto.dart';

class PrescriptionInformationResult {
  PrescriptionInformationResult({
    required this.status,
    this.prescriptionPatient,
  });

  bool status;
  List<PrescriptionPatient>? prescriptionPatient;
}
