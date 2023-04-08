import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/background/screen_background.dart';
import '../../../../../../../shared/dto/dto_info_basic_queries.dart';
import '../../../../../../../shared/models/model_especialidades.dart';
import 'card_list_queries.dart';

class ListContentQueries extends StatelessWidget {
  const ListContentQueries({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderQueries>(context, listen: false);
    final List<ModelEspecialidades> listEspecialidades =
        provider.mapEspecialidades['body'];

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
                        Expanded(
                          child: Text(
                            'Minhas consultas',
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: const Color(0xff1c1c1c),
                                fontSize: size.width * .05,
                                fontWeight: FontWeight.w400),
                          ),
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

                    final Iterable<ModelEspecialidades> especialidade =
                        listEspecialidades.where((element) =>
                            element.especialidadeId ==
                            infoBasicQueries.especialidadeId);

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: CardListQueries.modelCardList(
                              context: context,
                              infoBasic: infoBasicQueries,
                              especialidade: especialidade),
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
