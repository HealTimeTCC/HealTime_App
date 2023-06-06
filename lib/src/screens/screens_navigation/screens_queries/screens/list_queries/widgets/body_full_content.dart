import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/dto/dto_info_basic_queries.dart';
import '../../../../../../../shared/models/model_especialidades.dart';
import 'card_list_queries.dart';
import '../../details_query/details_query.dart';

class ListContentQueries extends StatelessWidget {
  const ListContentQueries({super.key, required this.idPerson});

  final int idPerson;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderQueries providerQueries =
        Provider.of<ProviderQueries>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(top: size.height * .07),
      padding: EdgeInsets.symmetric(
        vertical: size.height * .01,
        horizontal: size.width * .08,
      ),
      child: AnimationLimiter(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          itemCount: providerQueries.listQueries.length,
          itemBuilder: (context, index) {
            /* MODELO DE CARD PARA EXIBIR AS INFORMAÇÕES */
            final DtoInfoBasicQueries infoBasicQueries =
                providerQueries.listQueries[index];

            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsQuery(
                            personId: idPerson,
                            statusQuery: infoBasicQueries.statusConsultaId,
                            queryId: infoBasicQueries.consultasAgendadasId),
                      ),
                    ),
                    child: CardListQueries.modelCardList(
                      context: context,
                      infoBasic: infoBasicQueries,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
