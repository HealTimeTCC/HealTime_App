import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/dto_last_dosage.dart';
import '../data_locale/data_preferences_pessoa.dart';
import '../provider/login/provider_login.dart';

class ApiHomePage {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static String obterUri(BuildContext context) {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
    final String uriApi =
        '${providerLogin.addressServer ?? uriApiBase}Paciente/';
    return uriApi;
  }

  static Future<LastDosageDto?> UltimaDosage(
      BuildContext context, int applicator) async {
    String uriBase = obterUri(context);
    uriBase += 'UltimaDosagem/$applicator';
    late LastDosageDto lastDosageDto; //talve de erro
    try {
      var response = await http.get(
        Uri.parse(uriBase),
        headers: await ConstsRequired.headRequisit(),
      );
      switch (response.statusCode) {
        case 200:
          lastDosageDto = LastDosageDto.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);
          return lastDosageDto;
        case 404:
          return null;
        default:
          return null;
      }
    } catch (e) {
      return null;
    }
  }
}
