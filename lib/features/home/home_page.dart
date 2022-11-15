import 'package:aprendendo_flutter/features/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBarWidget(title: 'Aprendendo Flutter'),
      ),
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        oQueE(),
        Divider(),
        SizedBox(
          height: 8,
        ),
        _oQueVamosAprender()
      ],
    );
  }

  Widget oQueE() {
    return Padding(
      padding: EdgeInsets.all(16),
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
          SizedBox(
            width: 72,
            child: Image.asset(
              'assets/image/flutter.png',
              width: 72,
            ),
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
              SizedBox(
                width: 72,
                child: Image.asset(
                  'assets/image/flutter.png',
                  width: 72,
                ),
              ),
              SizedBox(
                width: 72,
                child: Image.asset(
                  'assets/image/dart_logo.png',
                  width: 72,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Flutter',
                textAlign: TextAlign.start,
                style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
              ),
              const Text(
                'Dart',
                textAlign: TextAlign.start,
                style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _oQueVamosAprender() {
    return Column(
      children: [
        Text(
          'O que vou aprender nesse app?',
          textAlign: TextAlign.start,
          style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        SizedBox(
          height: 16,
        ),
        _temas('O que é o flutter?', 'assets/image/flutter.png')],

    );
  }

  Widget _temas(String tema, String image) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tema,
              style: TextStyle(fontFamily: 'Frederic', fontSize: 14),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 70,
              height: 70,
              child: Image.asset(
                image,
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
          ],
        ),
      ],
    );
  }
}
