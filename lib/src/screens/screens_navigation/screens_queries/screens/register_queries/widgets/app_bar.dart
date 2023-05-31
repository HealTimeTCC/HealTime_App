import 'package:flutter/material.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/decorations/fonts_google.dart';

class AppBarQueries extends StatelessWidget {
  const AppBarQueries({
    super.key,
    required this.providerQueries,
  });

  final ProviderQueries providerQueries;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        IconButton(
          onPressed: () {
            providerQueries.disposeDoctor();
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.width * .08,
            color: const Color(0xff1AE8E4),
          ),
        ),
        SizedBox(width: size.width * .02),
        Expanded(
          child: Text(
            'Agendar consulta',
            style: FontGoogle.textTitleGoogle(size: size),
          ),
        )
      ],
    );
  }
}
