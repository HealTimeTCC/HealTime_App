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
import 'details_query.dart';

class ListContentQueries extends StatelessWidget {
  const ListContentQueries({super.key, required this.idPerson});

  final int idPerson;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderQueries>(context);

    return Stack(
      children: [
        const BackgroundPage(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* AppBar personalizada */
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: size.width * .08,
                            color: const Color(0xff1AE8E4),
                          ),
                        ),
                        SizedBox(width: size.width * .02),
                        Expanded(
                          child: Text(
                            'Minhas consultas',
                            style: FontGoogle.textTitleGoogle(size: size),
                          ),
                        ),
                        PopupMenuButton(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          itemBuilder: (context) =>
                              StatusConsulta.keys.map((int value) {
                            return PopupMenuItem(
                              value: value,
                              onTap: () => provider.alterListQueries(
                                  status: value,
                                  context: context,
                                  id: idPerson),
                              child: Text(
                                StatusConsulta[value],
                                style: FontGoogle.textNormaleGoogle(size: size),
                              ),
                            );
                          }).toList(),
                          child: const Icon(Icons.more_horiz),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
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
        ),
      ],
    );
  }
}
