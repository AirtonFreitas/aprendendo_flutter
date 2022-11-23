import 'package:flutter/material.dart';

import '../../configs/utils/colors_utils.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/drawer_app.dart';

class DartPage extends StatefulWidget {
  const DartPage({Key? key}) : super(key: key);

  @override
  State<DartPage> createState() => _DartPageState();
}

class _DartPageState extends State<DartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: AppBar(
              elevation: 0,
              backgroundColor: ColorsUtil.blue,
              title: const AppBarWidget(title: 'Linguagem Dart'),
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
          child: _buildBody(),
        ));
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildIntroducao(),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.sticky_note_2_outlined),
            SizedBox(width: 8),
            Text(
              'Sintaxe',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 20),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        _buildVariaveis(),
        const SizedBox(height: 32),
        _buildConstantes(),
        const SizedBox(height: 32),
        _buildIfElse(),
        const SizedBox(height: 32),
        _buildFor(),
        const SizedBox(height: 32),
        _buildSwitchCase()
      ],
    );
  }

  Widget _buildIntroducao() {
    return Column(
      children: [
        const Text(
          'Dart',
          style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        const SizedBox(height: 16),
        const Text(
          'Para as informações abaixo, estou considerando que você já sabe como funciona um algoritmo e já  tem conhecimento em lógica de programação.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        Row(
          children: [
            const Expanded(
              child: Text(
                'O Dart é uma linguagem de programação fortemente tipada inicialmente criada pela Google em 2011. '
                'A missão inicial do Dart era substituir o JavaScript para desenvolvimento de scripts em páginas web. ',
                style: TextStyle(
                  fontFamily: 'CaviarDreams',
                ),
              ),
            ),
            Image.asset(
              'assets/image/dart_name.png',
              width: 128,
            )
          ],
        ),
        const Text(
          'Porém, com a evolução da linguagem e com o passar dos anos, ela hoje pode ser considerada uma linguagem multi-paradigma, embora a linguagem apresente fortes estruturas típicas de linguagens orientadas a objeto. '
          '\nVou mostrar um pouco da sintaxe do dart.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Primeiro vamos ver como seria um siples \'Hello World\' em dart.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const Text(
          'main() {'
          '\n print(\'Hello World!\');'
          '\n}',
          style: TextStyle(
            fontFamily: 'Hack',
          ),
        ),
      ],
    );
  }

  Widget _buildVariaveis() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Variáveis',
                style: TextStyle(
                  fontFamily: 'Frederic',
                  fontSize: 18,
                )),
            const SizedBox(width: 16),
            Image.asset(
              'assets/image/fluttinho.png',
              width: 64,
            ),
          ],
        ),
        const Text(
          'Você pode criar uma variável sem declarar exatamente o tipo da variável. Mas o tipo da variável é inferido no momento em que você declarar um valor para a variável.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'var name;',
              style: TextStyle(
                fontFamily: 'Hack',
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'Type: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'dynamic',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'var test;',
              style: TextStyle(
                fontFamily: 'Hack',
              ),
            ),
            const SizedBox(width: 16),
            Container(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'Type: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'dynamic',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'var name = \'Airton\';',
              style: TextStyle(
                fontFamily: 'Hack',
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'Type: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'String',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'var test = 1;',
              style: TextStyle(
                fontFamily: 'Hack',
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'Type: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'int',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'var test = 1.0;',
              style: TextStyle(
                fontFamily: 'Hack',
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'Type: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'double',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Então o tipo \'var\' fica como dynamic caso não seja definido um valor para a variável. '
          'Após a definição de algum valor para variável ela tem o tipo inferido.'
          'E após isso não temos como alterar o tipo da variável.',
          style: TextStyle(fontFamily: 'CaviarDreams'),
        ),
      ],
    );
  }

  Widget _buildConstantes() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Variáveis Constantes',
                style: TextStyle(
                  fontFamily: 'Frederic',
                  fontSize: 18,
                )),
            const SizedBox(width: 16),
            Image.asset(
              'assets/image/fluttinho.png',
              width: 64,
            ),
          ],
        ),
        const Text(
          'Para declarar uma variável constante, basta ao invés de \'var\', usar a palavra \'final\'.',
          style: TextStyle(fontFamily: 'CaviarDreams'),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Text(
              'final String name = \'https://cws.correios/\';',
              style: TextStyle(
                fontFamily: 'Hack',
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildIfElse() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('If e Else',
              style: TextStyle(
                fontFamily: 'Frederic',
                fontSize: 18,
              )),
          const SizedBox(width: 16),
          Image.asset(
            'assets/image/fluttinho.png',
            width: 64,
          ),
        ],
      ),
      const Text(
        'Para o exemplo abaixo, se o saldo for maior ou igual ao valorSaque, ele permitirá realizar o saque. Senão o sistema não fará o saque.',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      const Text(
        'Entre os parênteses temos a condição do IF, caso atenda as condições o código dentro das chaves será executado. Caso não atenda as condições, será executado o código dentro das chaves do ELSE.',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      SizedBox(height: 16),
      const Text(
        'if(saldo >= valorSaque ){'
        '\n realiza operacao de saque'
        '\n}else{'
        '\n não realiza saque'
        '\n}',
        style: TextStyle(fontFamily: 'Hack'),
      )
    ]);
  }

  Widget _buildFor() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('For',
              style: TextStyle(
                fontFamily: 'Frederic',
                fontSize: 18,
              )),
          const SizedBox(width: 16),
          Image.asset(
            'assets/image/fluttinho.png',
            width: 64,
          ),
        ],
      ),
      const Text(
        'Para o exemplo do laço FOR, faremos uma contagem dos números até alcançar o número 10.',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      const Text(
        '',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      SizedBox(height: 16),
      const Text(
        'for (int num = 1; num <= 10; num++){'
        '\n print(num);'
        '\n}',
        style: TextStyle(fontFamily: 'Hack'),
      )
    ]);
  }

  Widget _buildSwitchCase() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Switch',
              style: TextStyle(
                fontFamily: 'Frederic',
                fontSize: 18,
              )),
          const SizedBox(width: 16),
          Image.asset(
            'assets/image/fluttinho.png',
            width: 64,
          ),
        ],
      ),
    ]);
  }
}
