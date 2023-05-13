import 'package:flutter/cupertino.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/consts/consts_required.dart';

class LogicListQueries {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<void> logicListQueries(
      {required BuildContext context, required int personId}) async {
    final ProviderQueries providerQuery =
        Provider.of<ProviderQueries>(context, listen: false);
    final ProviderLogin providerLogin =
        Provider.of<ProviderLogin>(context, listen: false);

    if (providerQuery.listSpecialties.isEmpty) {
      await providerQuery.getSpecialties(context);
    }

    final String address = providerLogin.addressServer ?? uriApiBase;

    await providerQuery.initialValues(id: personId, address: address);
  }

  static Future<void> logicAlterStatus(
      {required BuildContext context,
      required int personId,
      required int statusId}) async {
    final ProviderQueries providerQuery =
        Provider.of<ProviderQueries>(context, listen: false);
    final ProviderLogin providerLogin =
        Provider.of<ProviderLogin>(context, listen: false);

    final String address = providerLogin.addressServer ?? uriApiBase;

    providerQuery.alterListQueries(status: statusId, address: address, id: personId);
  }
}
