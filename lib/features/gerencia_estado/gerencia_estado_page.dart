import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../configs/utils/colors_utils.dart';
import '../home/home_page_store.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/button_ler_mais.dart';
import '../utils/widgets/drawer_app.dart';

final _homeStore = HomePageStore();

class GerenciaEstadoPage extends StatefulWidget {
  const GerenciaEstadoPage({Key? key}) : super(key: key);

  @override
  State<GerenciaEstadoPage> createState() => _GerenciaEstadoPageState();
}

class _GerenciaEstadoPageState extends State<GerenciaEstadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: AppBar(
              elevation: 0,
              backgroundColor: ColorsUtil.blue,
              title: const AppBarWidget(title: 'Gerência de Estado'),
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
    return Column(children: [
      _buildIntroducao(),
      const SizedBox(height: 16),
      const Text(
        'Detalhando um pouco...',
        style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),const SizedBox(height: 16),
      _homeStore.clickAd == false
          ? GestureDetector(
              child: const WidgetContinuarLendo(),
              onTap: () => _homeStore.setClickAd())
          : const SizedBox.shrink(),
      const SizedBox(height: 16),
      _homeStore.clickAd ? _detalhamento() : const SizedBox.shrink(),
    ]);
  }

  Widget _buildIntroducao() {
    return Column(children: [
      const Text(
        'Gerência de estado',
        style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),
      const Text(
        'A gerencia de estado é basicamente a forma que usamos para notificar o flutter quando ele precisa redesenhar um componente da tela, e como o flutter vai fazer isso de forma performática.'
        '\nPara fazer essa gerência, nós podemos usar algumas bibliotecas que vão nos auxiliar nessa tarefa. '
        'Em nosso exemplo usaremos o MOBX.',
        style: TextStyle(
          fontFamily: 'CaviarDreams',
        ),
      ),
      Image.asset('assets/image/mobx_triad.png'),
      const Text(
        'Nós temos 3 principais elementos envolvidos nessa gerência. '
        'Temos as Reactions, que basicamente é redesenhar na tela a informação. '
        'Temos os Observables, que são as variáveis observadas pelo flutter. O flutter vai olhar pra essa Observable e reescrever na tela, caso haja alteração na Observable. '
        'E temos as Actions, que são responsáveis por alterar os Observables.',
        style: TextStyle(
          fontFamily: 'CaviarDreams',
        ),
      ),
    ]);
  }

  Widget _detalhamento() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/image/estado_conta.png',
              width: 200,
            ),
            const Expanded(
              child: Text(
                'No nosso exemplo, o flutter está desenhando ali na tela o saldo da conta do usuário. '
                'No momento o saldo é de R\$632,00',
                style: TextStyle(
                  fontFamily: 'CaviarDreams',
                ),
              ),
            )
          ],
        ),
        const Text(
          'Depois que o flutter desenhou a tela, o usuário recebeu uma transferencia de R\$50,00.'
          'A variável foi alterada, mas o flutter não exibiu ainda o novo saldo.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/gerencia_flutt.png',
              width: 170,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: ColorsUtil.grayDark,
              child: RichText(
                text: const TextSpan(
                    text: 'double ',
                    style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'saldo',
                          style: TextStyle(color: Colors.indigoAccent)),
                      TextSpan(
                          text: ' = ', style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: '632.00',
                          style: TextStyle(color: Colors.lightBlue)),
                      TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Essa é a função que irá receber o novo saldo.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: const TextSpan(
                text: '_recebeDeposito',
                style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                  TextSpan(text: ' double'),
                  TextSpan(
                      text: ' valorDepositado ',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: '){', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '\n saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: 'saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' + ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: ' valorDepositado',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: ';', style: TextStyle(color: Colors.white)),
                  TextSpan(text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Entrada do novo saldo de R\$50,00',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: const TextSpan(
                text: '_recebeDeposito',
                style: TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                  TextSpan(text: ' double'),
                  TextSpan(
                      text: ' 50.00 ',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: '){', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '\n saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: 'saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' + ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: ' 50.00',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: ';', style: TextStyle(color: Colors.white)),
                  TextSpan(text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Neste momento o novo saldo é de R\$682.00',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            const Center(
              child: Icon(
                Icons.block,
                size: 170,
                color: Colors.red,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/gerencia_flutt.png',
                  width: 170,
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: ColorsUtil.grayDark,
                    child: RichText(
                      text: const TextSpan(
                          text: 'saldo',
                          style: TextStyle(
                              color: Colors.indigoAccent, fontFamily: 'Hack'),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' (',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: '682.00',
                                style: TextStyle(color: Colors.lightBlue)),
                            TextSpan(
                                text: ')',
                                style: TextStyle(color: Colors.white)),
                          ]),
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Mas a nossa tela não foi redesenhada. Ela continua mostrando o valor de R\$632,00. '
          'Então essa é a função da gerência do estado.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        const Text(
          'Vamos ver como fica com Mobx?',
          style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: const TextSpan(
                text: '@observable ',
                style: TextStyle(color: Colors.yellow, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(
                      text: '\ndouble ',
                      style: TextStyle(color: Colors.orange)),
                  TextSpan(
                      text: 'saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '632.00',
                      style: TextStyle(color: Colors.lightBlue)),
                  TextSpan(text: ';', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Então agora o saldo é um valor OBSERVABLE, ou seja, que pode ser observado por alguém.'
          '\n\nAgora o responsável por alterar o valor desse valor observável é a nossa ACTION. ',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: const TextSpan(
                text: '@action',
                style: TextStyle(color: Colors.yellow, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(
                      text: '\nrecebeDeposito',
                      style: TextStyle(color: Colors.orange)),
                  TextSpan(text: '(', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: ' double', style: TextStyle(color: Colors.orange)),
                  TextSpan(
                      text: ' 50.00 ',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: '){', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '\n saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: 'saldo',
                      style: TextStyle(color: Colors.indigoAccent)),
                  TextSpan(text: ' + ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: ' 50.00',
                      style: TextStyle(color: Colors.cyanAccent)),
                  TextSpan(text: ';', style: TextStyle(color: Colors.white)),
                  TextSpan(text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'E agora o nosso flutter, que está dentro de um OBSERVER, agora é um observador. Ele fica olhando para o OBBSERVABLE.'
          'Quando houver uma alteração, ele irá redesenhar o widget e mostrar o novo valor. ',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 170,
                color: Colors.green,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Observer: (',
                      style:
                          TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    ),
                    Image.asset(
                      'assets/image/fluttinho_redesenhando.png',
                      width: 170,
                    ),
                    const Text(
                      ')',
                      style:
                          TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: ColorsUtil.grayDark,
                    child: RichText(
                      text: const TextSpan(
                          text: 'saldo',
                          style: TextStyle(
                              color: Colors.indigoAccent, fontFamily: 'Hack'),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' (',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: '682.00',
                                style: TextStyle(color: Colors.lightBlue)),
                            TextSpan(
                                text: ')',
                                style: TextStyle(color: Colors.white)),
                          ]),
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'De forma resumida, essa é a função da Gerência de Estado.',
          style: TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
      ],
    );
  }
}
