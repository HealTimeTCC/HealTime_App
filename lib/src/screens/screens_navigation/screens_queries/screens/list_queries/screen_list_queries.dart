import 'package:flutter/material.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_full_content.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_null_content.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/screen_register_queries.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/api/api_queries.dart';
import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/models/model_pessoa.dart';

class ListQueries extends StatelessWidget {
  const ListQueries({Key? key, required this.pessoa}) : super(key: key);

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderQueries>(context);

    return FutureBuilder(
      future: provider.initialValues(id: pessoa.pessoaId),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return Container();
            }
          default:
            {
              return Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              RegisterQueries(dataPessoa: pessoa),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * .05)),
                      foregroundColor: const Color(0xff1AE8E4),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: size.width * .09,
                      ),
                    ),
                    body: provider.statusCode != 200
                        ? const NullContentQueries()
                        : const ListContentQueries(),
                  );
            }
        }
      },
    );
  }
}
