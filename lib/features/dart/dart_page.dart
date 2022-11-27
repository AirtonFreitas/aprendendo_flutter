import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../configs/utils/colors_utils.dart';
import '../home/home_page_store.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/button_ler_mais.dart';
import '../utils/widgets/drawer_app.dart';

final _homeStore = HomePageStore();

class DartPage extends StatefulWidget {
  const DartPage({Key? key}) : super(key: key);

  @override
  State<DartPage> createState() => _DartPageState();
}

class _DartPageState extends State<DartPage> {
  late AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: 'ca-app-pub-3721429763641925/1395983395',
    );
    interstitialAd.load();
  }

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
          child: Observer(builder: (BuildContext context) {
            return _buildBody();
          }),
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
        const SizedBox(height: 16),
        getBannerMid(AdmobBannerSize.BANNER),
        const SizedBox(height: 16),
        _homeStore.clickAd == false
            ? GestureDetector(
                child: const WidgetContinuarLendo(),
                onTap: () => _showInterstitial())
            : const SizedBox.shrink(),
        _homeStore.clickAd
            ? Column(
                children: [
                  _buildVariaveis(),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  getBannerMid(AdmobBannerSize.BANNER),
                  const SizedBox(height: 16),
                  _buildConstantes(),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _buildIfElse(),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _buildFor(),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _buildSwitchCase(),
                  const SizedBox(height: 16),
                  getBanner(AdmobBannerSize.BANNER),

                ],
              )
            : const SizedBox.shrink(),
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
        Container(
          padding: const EdgeInsets.all(16),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: const TextSpan(
                text: 'main',
                style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(text: '() {', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '\n print',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '\'Hello World!\'',
                      style: TextStyle(color: Colors.green)),
                  TextSpan(text: ')', style: TextStyle(color: Colors.white)),
                  TextSpan(text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'var ',
                    style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'name',
                          style: TextStyle(color: Colors.indigoAccent)),
                      TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDarkB,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'var ',
                    style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'test',
                          style: TextStyle(color: Colors.indigoAccent)),
                      TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDarkB,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'var ',
                    style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'name',
                          style: TextStyle(color: Colors.indigoAccent)),
                      TextSpan(
                          text: ' = ', style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: '\'Airton\'',
                          style: TextStyle(color: Colors.green)),
                      TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDarkB,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'var ',
                    style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'test',
                          style: TextStyle(color: Colors.indigoAccent)),
                      TextSpan(
                          text: ' = ', style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: '1', style: TextStyle(color: Colors.lightBlue)),
                      TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDarkB,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'var ',
                    style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'test',
                          style: TextStyle(color: Colors.indigoAccent)),
                      TextSpan(
                          text: ' = ', style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: '1.0',
                          style: TextStyle(color: Colors.lightBlue)),
                      TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: ColorsUtil.grayDarkB,
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
        const Text(
          'E você pode também criar a variável declarando o formato diretamente:',
          style: TextStyle(fontFamily: 'CaviarDreams'),
        ),
        const SizedBox(height: 16),
        Container(
            padding: const EdgeInsets.all(16),
            color: ColorsUtil.grayDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                      text: 'String ',
                      style:
                          TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'name',
                            style: TextStyle(color: Colors.indigoAccent)),
                        TextSpan(
                            text: ' = ', style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: '\'Airton\'',
                            style: TextStyle(color: Colors.green)),
                        TextSpan(
                            text: ';', style: TextStyle(color: Colors.white)),
                      ]),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                      text: 'int ',
                      style:
                          TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'age',
                            style: TextStyle(color: Colors.indigoAccent)),
                        TextSpan(
                            text: ' = ', style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: '23',
                            style: TextStyle(color: Colors.lightBlue)),
                        TextSpan(
                            text: ';', style: TextStyle(color: Colors.white)),
                      ]),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                      text: 'double ',
                      style:
                          TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'height',
                            style: TextStyle(color: Colors.indigoAccent)),
                        TextSpan(
                            text: ' = ', style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: '1.90',
                            style: TextStyle(color: Colors.lightBlue)),
                        TextSpan(
                            text: ';', style: TextStyle(color: Colors.white)),
                      ]),
                ),
              ],
            )),
        const SizedBox(height: 16),
        const Text(
          'Lembrando que não é possível alterar o formato da variável.',
          style: TextStyle(fontFamily: 'CaviarDreams'),
        )
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
        Container(
          padding: const EdgeInsets.all(16),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: const TextSpan(
                text: 'final String ',
                style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(
                      text: 'endpoint',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '\'https://cws.correios/\'',
                      style: TextStyle(color: Colors.green)),
                  TextSpan(text: ';', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
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
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(16),
        color: ColorsUtil.grayDark,
        child: RichText(
          text: const TextSpan(
              text: 'if',
              style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
              children: <TextSpan>[
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: ' saldo >= valorSaque ',
                    style: TextStyle(color: Colors.indigoAccent)),
                TextSpan(text: '){', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n realiza operacao de saque',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: '\n}', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'else'),
                TextSpan(text: '{', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n não realiza saque',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: '\n}', style: TextStyle(color: Colors.white))
              ]),
        ),
      ),
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
        'Para o exemplo do laço de repetição FOR, faremos uma contagem dos números até alcançar o número 10.',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      const Text(
        'Conforme sabemos, o laço for consiste em executar uma ação por um número determinado de vezes. E dentro dos parênteses() nós temos 3 parâmetros. ',
        style: TextStyle(fontFamily: 'CaviarDreams'),
      ),
      const SizedBox(height: 16),
      RichText(
        text: const TextSpan(
            text: 'Variável para controle ',
            style: TextStyle(
                color: Colors.indigoAccent,
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: ', ', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Condição para executar',
                  style: TextStyle(color: Colors.green)),
              TextSpan(text: ' e ', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Incremento da variável',
                  style: TextStyle(color: Colors.amber)),
              TextSpan(
                  text: '.'
                      '\nE com isso nós temos nosso ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal)),
              TextSpan(
                  text: 'trecho de código ',
                  style: TextStyle(color: Colors.purpleAccent)),
              TextSpan(
                  text: 'sendo repetido, quantas vezes precisarmos.',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal)),
            ]),
      ),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(16),
        color: ColorsUtil.grayDark,
        child: RichText(
          text: const TextSpan(
              text: 'for ',
              style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
              children: <TextSpan>[
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: 'int num = 1; ',
                    style: TextStyle(color: Colors.indigoAccent)),
                TextSpan(
                    text: 'num <= 10; ', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'num++', style: TextStyle(color: Colors.amber)),
                TextSpan(text: '){', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n print',
                    style: TextStyle(color: Colors.purpleAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: 'num', style: TextStyle(color: Colors.purpleAccent)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(text: '\n}', style: TextStyle(color: Colors.white))
              ]),
        ),
      ),
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
      const Text(
          'O comando Switch tem a função de executar um determinado código quando atender a uma condição específica. '
          'E geralmente é usado quando temos várias opções possíveis.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          )),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(16),
        color: ColorsUtil.grayDark,
        child: RichText(
          text: const TextSpan(
              text: 'switch ',
              style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
              children: <TextSpan>[
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'estado', style: TextStyle(color: Colors.blue)),
                TextSpan(text: ') {', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n   case \'MG\':',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\'O Imposto de MG é 18%\'',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n   case \'AC\':',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\'O Imposto de AC é 17%\'',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n   case \'AL\':',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\'O Imposto de AL é 12%\'',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n   case \'RJ\':',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\'O Imposto de RJ é 18%\'',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n   case \'SC\':',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\'O Imposto de SC é 17%\'',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n   default:',
                    style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: '\'Venda indisponível para seu estado.\'',
                    style: TextStyle(color: Colors.green)),
                TextSpan(text: ');', style: TextStyle(color: Colors.white)),
                TextSpan(text: '\n  }', style: TextStyle(color: Colors.white)),
              ]),
        ),
      ),
      const SizedBox(height: 16),
      const Text(
          'Por exemplo esse exemplo acima, o Switch está testando qual o ESTADO está sendo informado. '
          'Caso seja algum dos exemplos ele irá printar exatamente a aliquota. '
          'Mas caso o estado desconhecido, ele irá entrar na opção DEFAULT e irá exibir a mensagem que a venda está indisponível.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          )),
    ]);
  }

  AdmobBanner getBannerMid(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/4338336340',
      adSize: size,
    );
  }

  AdmobBanner getBanner(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/8336796261',
      adSize: size,
    );
  }

  Future<void> _showInterstitial() async {
    _homeStore.setClickAd();
    interstitialAd.show();
  }
}
