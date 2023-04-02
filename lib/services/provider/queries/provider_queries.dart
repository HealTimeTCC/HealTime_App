import 'package:flutter/material.dart';

import '../../../shared/dto/dto_info_basic_queries.dart';
import '../../api/api_queries.dart';

class ProviderQueries extends ChangeNotifier {
  List<DtoInfoBasicQueries> _listQueries = [];
  int _statusCode = 0;

  List<DtoInfoBasicQueries> get listQueries => _listQueries;
  int get statusCode => _statusCode;

  Future<void> initialValues({required int id}) async {
    Map<String, dynamic> mapData =
        await ApiQueries.getInfoQueries(status: 1, id: id);

    List<dynamic> listd = mapData['body'];

    _listQueries = listd.map((e) => DtoInfoBasicQueries.fromJson(e)).toList();
    _statusCode = mapData['statusCode'];
  }
}
