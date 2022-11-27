import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../configs/utils/colors_utils.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/drawer_app.dart';

class OndeEstudarPage extends StatefulWidget {
  const OndeEstudarPage({Key? key}) : super(key: key);

  @override
  State<OndeEstudarPage> createState() => _OndeEstudarPageState();
}

class _OndeEstudarPageState extends State<OndeEstudarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorsUtil.blue,
            title: const AppBarWidget(title: 'Onde aprender mais?'),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu_rounded,
                      color: Colors.white, size: 40),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          )),
      drawer: const DrawerApp(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (BuildContext context) {
          return _buildBody();
        }),
      ),
    );
  }

  Widget _buildBody() {
    return Column(children: [
      const Text(
        'Você deve estar se perguntando, como posso aprender mais?',
        style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),
      const Text(
        'Youtube',
        style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      const Text(
        'Existem muitos canais do Youtube que vão ajudar muito você que está começando.',
        style: TextStyle(
          color: ColorsUtil.black,
          fontFamily: 'CaviarDreams',
        ),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks('https://www.youtube.com/@Flutterando'),
            child: const Text(
              'Flutterrando',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/youtube.png',
            width: 30,
          )
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks('https://www.youtube.com/@FlutterCursos'),
            child: const Text(
              'Deivid Willyan | Flutter',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/youtube.png',
            width: 30,
          )
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks('https://www.youtube.com/@codigofontetv'),
            child: const Text(
              'Código fonte TV',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/youtube.png',
            width: 30,
          ),
        ],
      ),
      const SizedBox(height: 8),
      const Divider(),
      const SizedBox(height: 8),
      const Text(
        'Meus apps de ensino',
        style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks(
                'https://play.google.com/store/apps/details?id=com.airtonsiq.aprendendosql'),
            child: const Text(
              'Aprendendo SQL',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/aprendendo_sql.png',
            width: 60,
          ),
        ],
      ),
      const Text(
        'Me chame no linkedIn para conversar sobre tecnologia',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks(
                'https://www.linkedin.com/in/airton-siqueira-85260b174/'),
            child: const Text(
              'LinkedIn',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/linkedin.png',
            width: 30,
          ),
        ],
      ),
      const SizedBox(height: 8),
      const Divider(),
      const SizedBox(height: 8),
      const Text(
        'Sites oficiais do Flutter e Dart',
        style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks('https://pub.dev/'),
            child: const Text(
              'Pub Dev',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/flutter.png',
            width: 30,
          ),
        ],
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks('https://flutter.dev/'),
            child: const Text(
              'Flutter Dev',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/flutter.png',
            width: 30,
          ),
        ],
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () => _goLinks('https://dart.dev/'),
            child: const Text(
              'Dart Dev',
              style: TextStyle(
                  fontFamily: 'Frederic', fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/dart.png',
            width: 30,
          ),
        ],
      ),
      const SizedBox(height: 8),
      const Divider(),
      const SizedBox(height: 8),
      const Text(
        'Me conte o que você achou do app?',
        style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(32),
        color: ColorsUtil.grayC,
        child: Column(
          children: [
            const Text('Avalie o app',
                style: TextStyle(
                    fontFamily: 'CaviarDreams',
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  _goLinks(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
