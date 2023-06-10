import 'medication_progress_dto.dart';

class ProgressMedicationInformationDto{
  ProgressMedicationInformationDto({
    required this.status,
});
  bool status;
  List<MedicationProgressDto>? listMedicationProgressDto;
}