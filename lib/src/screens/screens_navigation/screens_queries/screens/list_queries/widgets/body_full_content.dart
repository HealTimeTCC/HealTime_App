import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../shared/background/screen_background.dart';
import '../../../widgets/card_list_queries.dart';

class ListContentQueries extends StatelessWidget {
  const ListContentQueries({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
                    children: [
                      const BackgroundPage(),
                      SingleChildScrollView(
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /* AppBar personalizada */
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: size.width * .03),
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

                                /* Listagem das consultas */
                                /* Quando a API estiver pronta a gente vai usar a ListView.builder para maior performace */

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                      CardListQueries.modelCardList(context: context),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
  }
}