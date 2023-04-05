// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healtime/core/myApp.dart';
import 'package:healtime/services/api/api_doctor.dart';
import 'package:healtime/services/api/api_queries.dart';
import 'package:healtime/shared/consts/consts_required.dart';
import 'package:healtime/shared/models/model_doctor.dart';
import 'package:http/http.dart' as http;

void main() async {
  testWidgets('Obter médicos', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    List<Medico> doctor = await ApiMedico.obterMedicosAsync();

    expect(doctor, isNotNull);
    expect(doctor, isNot(Exception()));
  });

  testWidgets('Obter especialidades', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    Uri uriApi = Uri.parse('${ConstsRequired.urlBaseApi}ConsultaMedica/Especialidades');

    await http.get(uriApi). then((value) {
      expect(value, isNot(Exception));
      expect(value.body, isNotNull);
      expect(value.statusCode, isNot(200));
    });
  });
}
