import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:aprendendo_flutter/features/utils/widgets/app_bar.dart';
import 'package:aprendendo_flutter/src/utils/drawer_app.dart';
import 'package:flutter/material.dart';

import '../utils/widgets/button_next.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorsUtil.blue,
            title: const AppBarWidget(title: 'Aprendendo Flutter'),
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
        controller: _scrollController,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _widgetFlutter(),
        const Divider(),
        const SizedBox(
          height: 8,
        ),
        _widgetConteudo(),
        const SizedBox(
          height: 8,
        ),
        const ButtonNext()
      ],
    );
  }

  Widget _widgetFlutter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          const Text(
            'O que é o flutter?',
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
          ),
          const Text(
            'O Flutter é um dos principais frameworks para o desenvolvimento de aplicações mobile.',
            style: TextStyle(fontFamily: 'CaviarDreams', fontSize: 16),
          ),
          const Text(
            'Criado pela Google, com o Flutter conseguimos desenvolver aplicações nativas para Android e iOS a partir de um único código base.',
            style: TextStyle(fontFamily: 'CaviarDreams', fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            'assets/image/flutter.png',
            width: 64,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Qual linguagem o flutter usa?',
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
          ),
          const Text(
            'O Flutter utiliza uma linguagem também criado pelo próprio Google, chamada Dart.',
            style: TextStyle(fontFamily: 'CaviarDreams', fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/image/flutter_name.png',
                width: 72,
              ),
              const Icon(Icons.compare_arrows_rounded),
              Image.asset(
                'assets/image/dart_name.png',
                width: 72,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: const TextSpan(
              text: 'Dart',
              style: TextStyle(
                  color: ColorsUtil.black,
                  fontFamily: 'CaviarDreams',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text:
                      ' é uma linguagem de programação independente de qualquer plataforma. Linguagem de código aberto e orientada a objetos que compreende uma variedade de recursos úteis para um desenvolvedor de software.',
                  style: TextStyle(
                      color: ColorsUtil.black,
                      fontFamily: 'CaviarDreams',
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Flutter',
              style: TextStyle(
                  color: ColorsUtil.black,
                  fontFamily: 'CaviarDreams',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text:
                      ' é um kit de ferramentas de interface de usuário portátil completo com ferramentas e widgets. Ele fornece aos desenvolvedores uma plataforma para construir e implementar aplicativos compilados nativamente e visualmente atraentes para várias plataformas com facilidade.',
                  style: TextStyle(
                      color: ColorsUtil.black,
                      fontFamily: 'CaviarDreams',
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetConteudo() {
    return Column(
      children: [
        const Text(
          'O que vou aprender nesse app?',
          textAlign: TextAlign.start,
          style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        const SizedBox(
          height: 32,
        ),
        _temas(
          'O que é o flutter??',
          'assets/image/flutter.png',
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'widgets'),
              child:
                  _temas('O que são os Widgets?', 'assets/image/widgets.png'),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'dart'),
              child: _temas('O que é o dart?', 'assets/image/dart.png'),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'gerencia-estado'),
                child: _temas(
                    'Gerencia de Estado', 'assets/image/gerencia_estado.png')),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'multiplataforma'),
              child: _temas(
                  'Multiplataforma?', 'assets/image/multiplataforma.png'),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'onde-estudar'),
              child: _temas('Onde estudar?', 'assets/image/pesquisa.png'),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }

  Widget _temas(String tema, String image) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Image.asset(
            fit: BoxFit.fill,
            image,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(tema,
            style: const TextStyle(
              fontFamily: 'Frederic',
              fontSize: 14,
            )),
      ],
    );
  }
}
