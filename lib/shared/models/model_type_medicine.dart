class TypeMedicine {
  TypeMedicine(
      {required this.classApplication,
      required this.descMedicine,
      required this.titleTypeMedicine,
      required this.typeMedicineId});

  int typeMedicineId;
  String descMedicine;
  String titleTypeMedicine;
  int classApplication;

  factory TypeMedicine.fromJson(Map<String, dynamic> json) => TypeMedicine(
        classApplication: json['classeAplicacao'] as int,
        descMedicine: json['descMedicacao'] as String,
        titleTypeMedicine: json['tituloTipoMedicacao'] as String,
        typeMedicineId: json['tipoMedicacaoId'] as int,
      );
}
