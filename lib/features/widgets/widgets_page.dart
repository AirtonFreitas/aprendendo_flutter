// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../configs/utils/colors_utils.dart';
import '../../src/utils/drawer_app.dart';
import '../utils/widgets/app_bar.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorsUtil.blue,
            title: const AppBarWidget(title: 'Widgets'),
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
        child: Center(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildIntroducao(),
        _buildExemplo(),
      ],
    );
  }

  Widget _buildIntroducao() {
    return Column(children: [
      const Text(
        'O que são os Widgets?',
        style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),
      Row(
        children: [
          const Flexible(
            child: Text(
              softWrap: true,
              'Os componentes de telas do flutter são feitos com base em um conjunto de Widgets. \nUm widget é um componente visual na interface do dispositivo. ',
              style: TextStyle(
                color: ColorsUtil.black,
                fontFamily: 'CaviarDreams',
              ),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/image/widgets.png',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ],
      ),
      const Text('Os widgets são divididos em duas categorias',
          style: TextStyle(fontFamily: 'Frederic', fontSize: 16)),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Layout',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 24)),
          const Text('Interface',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 24))
        ],
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Flexible(
            child: Text(
                'Widgets de Layout são os widgets que organizam a tela. E recebem os widgets de interface.',
                style: TextStyle(
                  fontFamily: 'CaviarDreams',
                )),
          ),
          const Flexible(
            child: Text(
                'Widgets de interface são os widgets que irão ser exibidos na interface do usuário.',
                style: TextStyle(
                  fontFamily: 'CaviarDreams',
                )),
          ),
        ],
      ),
      const Divider(),
      const SizedBox(height: 16),
    ]);
  }

  Widget _buildExemplo() {
    return Column(children: [
      Row(
        children: [
          const Icon(Icons.widgets_outlined),
          const SizedBox(width: 8),
          const Text(
            'Widgets de Layout',
            style: TextStyle(fontFamily: 'Frederic', fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ],
      ),
      const SizedBox(height: 16),
      _buildScaffold(),
      const SizedBox(height: 32),
      _buildContainer(),
      const SizedBox(height: 32),
      _buildColumnandRow(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      Row(
        children: [
          const Icon(Icons.widgets_outlined),
          const SizedBox(
            width: 8,
          ),
          const Text(
            'Widgets de Interface',
            style: TextStyle(fontFamily: 'Frederic', fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ],
      ),
      const SizedBox(height: 32),
      _buildText(),
      const SizedBox(height: 32),
      _buildImage(),
      const SizedBox(height: 32),
      _buildIcon(),
      const SizedBox(height: 32),
      _buildButton(),
      const SizedBox(height: 32),
      Divider(),
      const Text(
        'Agora já sabemos como funcionam os widgets e alguns dos exemplos mais comuns.'
            '\nExistem vários outros widgets que podem ser utilizados e cada um possui suas peculiaridades. A recomendação é sempre buscar aprender mais e em fontes confiáveis.',
        style: TextStyle(fontFamily: 'CaviarDreams'),
        textAlign: TextAlign.start,
      ),
    ]);
  }

  Widget _buildScaffold() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Scaffold',
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
        const SizedBox(
          height: 16,
        ),
        const Text(
            'O Scaffold é uma classe em flutter que fornece muitos widgets de interface como Drawer, BottonNavigationBar, FloatingActionButton, AppBar, Body entre outros. '
            'O Scaffold irá expandir e ocupar toda a tela do dispositivo, ocupando todo o espaço disponível.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                style: TextStyle(fontFamily: 'Hack', fontSize: 12),
                'Scaffold('
                '\n appBar: ,'
                '\n drawer: ,'
                '\n body: ,'
                '\n floatingActionButton: ,'
                '\n bottomNavigationBar: ,'
                '\n);',
              ),
            ),
            Image.asset(
              'assets/image/scaffold.png',
              width: 200,
            )
          ],
        ),
        const Text(
            'No código exibido acima, temos somente a declaração de algumas propriedades do Scaffold, mas não temos o widgets de interface que será exibido. '
            'Para que seja exibido os componentes de interface(appBar, drawer, body), precisamos declarar cada widget.\n'
            'Para criar uma tela semelhante a esta, o código seria este:',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(
          height: 8,
        ),
        const Text(
          style: TextStyle(fontFamily: 'Hack', fontSize: 12),
          'Scaffold('
          '\n  appBar: AppBar(title : \'Teste Aplicativo\'),'
          '\n  drawer: DrawerApp('
          '\n    leading: Builder(builder: (BuildContext context){'
          '\n      Icon(Icons.menu_rounded);'
          '\n})),'
          '\n  body: Container(),'
          '\n  floatingActionButton: FloatingActionButton('
          '\n        child: Icon(Icons.add),),'
          '\n  bottomNavigationBar: BottomNavigationBar( '
          '\n      icon: Icon(Icon.home),  '
          '\n      label:\'home\'),'
          '\n);',
        ),
        const SizedBox(height: 16),
        const Text(
            'Então o nosso Scaffold irá receber alguns widgets de interface, que serão exibidos, cada um em seu lugar.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
      ],
    );
  }

  Widget _buildContainer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Container',
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
        Row(
          children: [
            const Expanded(
              child: Text(
                  'Um container é um widget que possui propriedades para dimensionamento, arredondamento, cores e espaçamento. '
                  'Basicamente um container é uma \'caixa\' para armazenar conteúdo. '
                  'Ele recebe outros widgets a partir da propriedade \'child: \'.',
                  style: TextStyle(
                    fontFamily: 'CaviarDreams',
                  )),
            ),
            Image.asset(
              'assets/image/container.png',
              width: 200,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70,
              height: 70,
              color: Colors.green,
              child: const Text('texto que será exibido'),
            ),
            const Text(
              style: TextStyle(fontFamily: 'Hack', fontSize: 12),
              'Container('
              '\n width: 70,'
              '\n height: 70,'
              '\n color: Colors.green,'
              '\n child: '
              '\n   Text(\'texto que será exibido\'),'
              '\n);',
            ),
          ],
        ),
        const Text(
            'Neste exemplo temos um widget com várias propriedades. '
            'Altura 70, Largura 70, Cor de fundo. E temos dentro deste widget o texto sendo exibido.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
      ],
    );
  }

  Widget _buildColumnandRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Column e Row',
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
            'Outros widgets muito usados para construção de layouts são as Columns e Rows (colunas e linhas). '
            'Estes widgets em especial, são usados para posicionar os widgets de interface.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        Row(
          children: [
            Image.asset(
              'assets/image/row_column.png',
              width: 200,
            ),
            const Expanded(
              child: Text(
                  'As Columns fazem o empilhamento vertical dos widgets, enquanto as Rows fazem o enfileiramento horizontal. '
                  '\nTemos duas propriedades muito importantes para esses widgets que são \'mainAxisAlignment\' e \'crossAxisAlignment\'.'
                  '\nEssas duas propriedades são responsáveis por organizar todos os componentes dentro do widget.',
                  style: TextStyle(
                    fontFamily: 'CaviarDreams',
                  )),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 32),
            const Expanded(
                child: Text(
              style: TextStyle(fontFamily: 'Hack', fontSize: 12),
              'Column('
              '\n children: ['
              '\n   Text(\'primeiro\'),'
              '\n   Text(\'segundo\'),'
              '\n   Text(\'terceiro\'),'
              '\n ],'
              '\n),',
            )),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: Column(
                children: [
                  const Text('primeiro'),
                  const Text('segundo'),
                  const Text('terceiro'),
                ],
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            const Expanded(
                child: Text(
              style: TextStyle(fontFamily: 'Hack', fontSize: 12),
              'Row('
              '\n children: ['
              '\n   Text(\'primeiro\'),'
              '\n   Text(\'segundo\'),'
              '\n   Text(\'terceiro\'),'
              '\n ],'
              '\n),',
            )),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: Row(
                children: [
                  const Text('primeiro '),
                  const Text('segundo '),
                  const Text('terceiro '),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        //Text('data')
      ],
    );
  }

  Widget _buildImage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Imagens',
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
            'Temos a opção de exibir uma imagem no app flutter diretamente da internet, ou salva dentro de uma pasta local. '
            'Para exibir uma imagem na tela, usamos esse widget \'Image()\'.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        const Text(
            style: TextStyle(
              fontFamily: 'Hack',
            ),
            'Image.network(\'url da imagem\'),'
            '\nImage.asset(\'caminho local da imagem\')'),
        const SizedBox(height: 16),
        const Text(
            'Como exemplo, vamos pegar uma imagem de um outro aplicativo e exibir aqui em nossa tela.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(
                child: Text(
                    style: TextStyle(fontFamily: 'Hack', fontSize: 10),
                    'Image.network(\n  \'https://play-lh.googleusercontent.com/v8jLJpznONNKeFwynI9-IQtDRlwqcYIV9oCz0JplSFpyjlDQakZ7E-Sd3FGFyuG4I3s=w240-h480-rw\',\nwidth: 100,)')),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: Image.network(
                'https://play-lh.googleusercontent.com/v8jLJpznONNKeFwynI9-IQtDRlwqcYIV9oCz0JplSFpyjlDQakZ7E-Sd3FGFyuG4I3s=w240-h480-rw',
                width: 80,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildText() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Textos',
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
            'Para exibir um texto na tela, podemos usar esse widget \'Text()\'.',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Text(\'Teste de um Text\'),',
                style: TextStyle(
                  fontFamily: 'Hack',
                )),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(2),
              color: Colors.green,
              child: const Text('Teste de um Text'),
            )
          ],
        )
      ],
    );
  }

  Widget _buildIcon() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Icones',
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
            'O flutter possui vários ícones que podemos usar para criar nossos layouts. '
            'Para isso podemos usar o widget Icon().',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Icon(Icons.access_alarm)',
                style: TextStyle(
                  fontFamily: 'Hack',
                )),
            const SizedBox(width: 20),
            Container(
                padding: const EdgeInsets.all(6),
                color: Colors.green,
                child: const Icon(Icons.access_alarm))
          ],
        ),
        const SizedBox(height: 4),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Icon(Icons.add_a_photo)',
                style: TextStyle(
                  fontFamily: 'Hack',
                )),
            const SizedBox(width: 20),
            Container(
                padding: const EdgeInsets.all(6),
                color: Colors.green,
                child: const Icon(Icons.add_a_photo))
          ],
        ),
        const SizedBox(height: 4),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Icon(Icons.flash_off)',
                style: TextStyle(
                  fontFamily: 'Hack',
                )),
            const SizedBox(width: 20),
            Container(
                padding: const EdgeInsets.all(6),
                color: Colors.green,
                child: const Icon(Icons.flash_off))
          ],
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Botões',
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
            'Temos vários widgets que podem fazer a função de \'captura de toque\', ou seja, botões.'
            'Um exemplo é o TextButton().',
            style: TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 20),
            const Expanded(
                child: Text(
                    'TextButton('
                    '\n onPressed: (){FUNÇÃO}, '
                    '\n child: Text(\'Enviar\')'
                    '\n)',
                    style: TextStyle(
                      fontFamily: 'Hack',
                    ))),
            TextButton(onPressed: () {}, child: const Text('Enviar')),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
