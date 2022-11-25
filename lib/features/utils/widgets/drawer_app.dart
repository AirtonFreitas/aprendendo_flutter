// ignore_for_file: prefer_const_constructors

import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/background_drawer.png'),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  Text(
                    'Aprendendo Flutter',
                    style: TextStyle(fontFamily: 'Frederic'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset('assets/image/flutterinho_ensinando.png'),
                ],
              )),
          ListTile(
            leading: Icon(Icons.code),
            title: Text(
              'O que é o Flutter?',
              style: TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.popAndPushNamed(context, 'home');
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.settings_ethernet),
            title: Text(
              'O que é o Dart?',
              style: TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'dart');
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.widgets_outlined),
            title: Text(
              'O que são os Widgets?',
              style: TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'widgets');
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.remove_red_eye_outlined),
            title: Text(
              'O que é gerência de estado?',
              style: TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'gerencia-estado');
            },
          ),
          const Divider(),
          ListTile(
            //trailing: Icon(Icons.screenshot_outlined),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.screenshot_outlined),
                Icon(Icons.screenshot_monitor),
              ],
            ),
            title: Text(
              'O que é ser multiplataforma?',
              style: TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'multiplataforma');
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text(
              'Como aprender mais?',
              style: TextStyle(fontFamily: 'Frederic'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'onde-estudar');
            },
          ),
          const Divider(color: ColorsUtil.black),
          Column(
            children: [
              SizedBox(height: 16),
              Text(
                'Aprenda mais com nossos apps',
                style: TextStyle(fontFamily: 'Frederic'),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _goAprendendoSql();
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 32,
                    ),
                    Image.asset(
                      'assets/image/aprendendo_sql.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Aprendendo SQL',
                      style: TextStyle(fontFamily: 'Frederic'),
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
