import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_home_page.dart';
import 'package:healtime/services/provider/queries/provider_queries.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:provider/provider.dart';

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/dto_info_basic_queries.dart';
import '../../shared/dto/dto_last_dosage.dart';
import '../../shared/models/enuns/enum_status_code.dart';
import '../api/api_queries.dart';
import '../data_locale/data_preferences_pessoa.dart';
import 'login/provider_login.dart';

class ProviderHomePage extends ChangeNotifier {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  Pessoa? _dataPerson;

  Pessoa? get getDataPerson => _dataPerson;

  DtoInfoBasicQueries? _nextQuery;

  DtoInfoBasicQueries? get nextQuery => _nextQuery;

  TypeChargeView _statusCodeChargeHome = TypeChargeView.awaitCharge;

  TypeChargeView get getStatusCodeChargeHome => _statusCodeChargeHome;
  LastDosageDto? _dtoDataLastDosage;

  LastDosageDto? get getDataLastDosage => _dtoDataLastDosage;

  void chargeDataPerson(BuildContext context) async {
    _statusCodeChargeHome = TypeChargeView.awaitCharge;
    await getCodApplicator();
    if (_dataPerson == null) {
      _statusCodeChargeHome = TypeChargeView.notFound;
    } else {
      _dtoDataLastDosage =
      await ApiHomePage.UltimaDosage(context, _dataPerson!.pessoaId!);
      _statusCodeChargeHome = TypeChargeView.success;
    }
    notifyListeners();
  }

  Future<void> getCodApplicator() async =>
      _dataPerson = await DataPreferencesPessoa.getDataUser();

  Future<void> getQuery(BuildContext context) async {
    _nextQuery = null;

    final ProviderLogin providerLogin =
    Provider.of<ProviderLogin>(context, listen: false);
    final ProviderQueries providerQuery =
    Provider.of<ProviderQueries>(context, listen: false);

    if (providerQuery.listSpecialties.isEmpty) {
      await providerQuery.getSpecialties(context);
    }

    await getCodApplicator();

    final String address = providerLogin.addressServer ?? uriApiBase;

    Map<String, dynamic> mapData = await ApiQueries.getInfoQueries(
        status: 1, id: _dataPerson?.pessoaId ?? 1, addressServer: address);

    List<DtoInfoBasicQueries> listQueries = [];

    if (mapData['statusCode'] == 200) {
      List<dynamic> listData = mapData['body'];

      listQueries.addAll(listData.map((e) => DtoInfoBasicQueries.fromJson(e)).toList());
      listQueries.sort((a, b) => a.dataConsulta.compareTo(b.dataConsulta));

      _nextQuery = listQueries.firstWhere((element) => element.statusConsultaId == 1);
    }
  }
}
