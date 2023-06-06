import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:healtime/shared/dto/dto_info_basic_queries.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/card_list_queries.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/provider_home_page.dart';
import '../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/models/model_pessoa.dart';
import '../../../../../shared/widgets/loading_queries.dart';
import '../../screens_queries/logics/logic_type_user.dart';
import '../../screens_queries/screens/details_query/details_query.dart';
import '../../screens_queries/screens/list_queries/widgets/screens_query.dart';

class NextQuery extends StatelessWidget {
  const NextQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderQueries>(context);
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Próxima consulta",
                style: FontGoogle.textTitleGoogle(
                    size: size, colorText: Colors.black),
              ),
            ),
            Bounceable(
              onTap: () async => await TypeUser.typeUserNavigator(context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .01,
                  horizontal: size.width * .04,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff25D8D5),
                  borderRadius: BorderRadius.circular(size.width * .04),
                ),
                child: Text(
                  'Ver tudo',
                  style: FontGoogle.textNormaleGoogle(
                    size: size * .6,
                    colorText: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Consumer<ProviderHomePage>(builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: size.height * .025,
              horizontal: size.width * .04,
            ),
            child: FutureBuilder(
              future: value.getQuery(context),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      return const LoadingQueries();
                    }
                  default:
                    {
                      final DtoInfoBasicQueries? query = value.nextQuery;

                      final Pessoa? person = value.getDataPerson;

                      if (query == null || person == null) {
                        String msg =
                            'Desculpe, não conseguimos obter as informações do usuário.';

                        if (query == null) {
                          msg = 'No momento, não há consultas pendentes.';
                        }

                        return QueryPersonNotFound(msgUser: msg);
                      }

                      return Bounceable(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsQuery(
                              personId: (person.pessoaId ?? 1),
                              statusQuery: query.statusConsultaId,
                              queryId: query.consultasAgendadasId,
                            ),
                          ),
                        ),
                        child: CardListQueries.modelCardList(
                          context: context,
                          infoBasic: query,
                        ),
                      );
                    }
                }
              },
            ),
          );
        }),
      ],
    );
  }
}
