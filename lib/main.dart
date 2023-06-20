import 'package:flutter/material.dart';
import 'package:healtime/services/data_locale/data_preferences.dart';
import 'package:healtime/services/data_locale/data_preferences_pessoa.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:healtime/services/provider/queries/provider_details_queries.dart';
import 'package:healtime/services/provider/queries/provider_navbar.dart';
import 'package:healtime/services/provider/queries/provider_queries.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/myApp.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferences.getInstance();
    print('Passou caceta');

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ProviderPrescriptionMedical(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProviderHomePage(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProviderQueries(),
          ),
          ChangeNotifierProvider(
            create: (_) => NavbarProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProviderLogin(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProviderDetailsQuery(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  } catch (ex) {
    print('Deu merda. ${ex.toString()}');
  }
}
