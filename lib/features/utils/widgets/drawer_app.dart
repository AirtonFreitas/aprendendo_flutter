import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/background_drawer.png'),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context).titleApp,
                    style: const TextStyle(fontFamily: 'Frederic'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset('assets/image/flutterinho_ensinando.png'),
                ],
              )),
          ListTile(
            leading: const Icon(Icons.code),
            title: Text(
              AppLocalizations.of(context).whatFlutter,
              style: const TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.popAndPushNamed(context, 'home');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_ethernet),
            title: Text(
              AppLocalizations.of(context).whatDart,
              style: const TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'dart');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: Text(
              AppLocalizations.of(context).whatWidgets,
              style: const TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'widgets');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.remove_red_eye_outlined),
            title: Text(
              AppLocalizations.of(context).whatState,
              style: const TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'gerencia-estado');
            },
          ),
          const Divider(),
          ListTile(
            //trailing: Icon(Icons.screenshot_outlined),
            leading: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.screenshot_outlined),
                Icon(Icons.screenshot_monitor),
              ],
            ),
            title: Text(
              AppLocalizations.of(context).whatMultiplatform,
              style: const TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'multiplataforma');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(
              AppLocalizations.of(context).learn,
              style: const TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'onde-estudar');
            },
          ),
          const Divider(color: ColorsUtil.black),
          Column(
            children: [
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context).learnApps,
                style: const TextStyle(fontFamily: 'Frederic'),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _goAprendendoSql();
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 32,
                    ),
                    Image.asset(
                      'assets/image/aprendendo_sql.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      AppLocalizations.of(context).learnSqlTitle,
                      style: const TextStyle(fontFamily: 'Frederic'),
                    ),
                  ],
                ),
              )
            ],
          ),
          Image.asset(
            'assets/image/fluttinho.png',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }

  _goAprendendoSql() async {
    final Uri url = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.airtonsiq.aprendendosql');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
