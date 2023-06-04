import 'package:healtime/shared/dto/medicines_on_prescription_dto/prescription_medicine_dto.dart';

class DetailsPrescriptionMedicineResult {
  DetailsPrescriptionMedicineResult({
    required this.status,
    this.prescriptionMedicine,
  });

  bool status;
  List<PrescriptionMedicine>? prescriptionMedicine;
}
