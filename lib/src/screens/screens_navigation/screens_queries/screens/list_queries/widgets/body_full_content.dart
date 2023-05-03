import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../../shared/decorations/screen_background.dart';
import '../../../../../../../shared/dto/dto_info_basic_queries.dart';
import '../../../../../../../shared/models/maps/enum_status_consulta.dart';
import '../../../../../../../shared/models/model_especialidades.dart';
import 'card_list_queries.dart';
import '../../details_query/details_query.dart';

class ListContentQueries extends StatelessWidget {
  const ListContentQueries({super.key, required this.idPerson});

  final int idPerson;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderQueries>(context);

    return Container(
      margin: EdgeInsets.only(top: size.height * .07),
      padding: const EdgeInsets.all(16.0),
      child: Consumer<ProviderQueries>(
        builder: (context, value, child) {
          return AnimationLimiter(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: provider.listQueries.length,
              itemBuilder: (context, index) {
                /* MODELO DE CARD PARA EXIBIR AS INFORMAÇÕES */
                DtoInfoBasicQueries infoBasicQueries =
                    provider.listQueries[index];

                final Iterable<ModelEspecialidades> specialties =
                    value.listSpecialties.where((element) =>
                        element.especialidadeId ==
                        infoBasicQueries.especialidadeId);

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
                                queryId:
                                    infoBasicQueries.consultasAgendadasId),
                          ),
                        ),
                        child: CardListQueries.modelCardList(
                          context: context,
                          infoBasic: infoBasicQueries,
                          especialidade: specialties,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
