class Medico {
  Medico(
      {required this.CrmMedico,
      required this.MedicoId,
      required this.NmMedico,
      required this.UfCrmMedico}) {}

  int MedicoId = 0;
  String NmMedico = '';
  int CrmMedico = 0;
  String UfCrmMedico = '';
  
  Medico.fromJson(Map<String, dynamic> json) {
    MedicoId    = json['medicoId'];
    NmMedico    = json['nmMedico'];
    CrmMedico   = json['crmMedico'];
    UfCrmMedico = json['ufCrmMedico'];
  }


  Map<String, dynamic> toJson() {
    return {
      'MedicoId'    : MedicoId,
      'NmMedico'    : NmMedico,
      'CrmMedico'   : CrmMedico,
      'UfCrmMedico' : UfCrmMedico
    };
  }
}
