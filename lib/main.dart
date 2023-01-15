import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'configs/utils/app_routes.dart';
import 'configs/utils/colors_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String rota = 'splash';

Future<void> main() async {
  try {
    WidgetsFlutterBinding?.ensureInitialized();
    await Firebase.initializeApp();
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final String link = initialLink.link.toString();

      if (link.contains('widgets')) {
        rota = 'widgets';
      } else if (link.contains('gerencia-estado')) {
        rota = 'gerencia-estado';
      } else if (link.contains('multiplataforma')) {
        rota = 'multiplataforma';
      } else if (link.contains('dart')) {
        rota = 'dart';
      }
    }
  } catch (e) {
    rethrow;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprendendo Flutter',
      theme: ThemeData(
          fontFamily: 'Heavitas',
          primaryColor: ColorsUtil.black,
          buttonTheme: const ButtonThemeData(
            buttonColor: ColorsUtil.black,
            textTheme: ButtonTextTheme.accent,
          ),
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(headline6: const TextStyle(fontFamily: 'Heavitas')),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: ColorsUtil.black)),
      initialRoute: rota,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('pt', ''),
        Locale('es', ''),
      ],
    );
  }
}
