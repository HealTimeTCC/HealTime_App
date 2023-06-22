// if (codPaciente == 0) {
//         final Pessoa? person = await DataPreferencesPessoa.getDataUser();

//         if (person != null) {
//           if (person.pessoaId != null) {
//             codPaciente = person.pessoaId!;
//           }
//         }
//       }

// import 'package:flutter/material.dart';
// import 'package:healtime/services/api/api_patient.dart';
// import 'package:healtime/shared/dto/dto_post_associate_carer.dart';

// class ProviderAssociateResponsibleCarer extends ChangeNotifier {
//   Future<void> AssociateResponsibleCarer(
//       {required DtoPostAssociateCarer postAssociateCarer,
//       required BuildContext context}) async {


//     DtoPostAssociateCarer dtoCarer = DtoPostAssociateCarer(
//         patientId: postAssociateCarer.patientId,
//         patientCPF: postAssociateCarer.patientCPF,
//         createdIn: postAssociateCarer.createdIn,
//         carerCPF: postAssociateCarer.carerCPF,
//         carerId: postAssociateCarer.carerId);

//          Map<String, dynamic> response =
//         await ApiPaciente.PostAssociateResponsibleCarer(context: dtoCarer);
//   }
// }
