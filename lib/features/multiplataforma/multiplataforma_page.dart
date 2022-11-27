import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import '../../configs/utils/colors_utils.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/drawer_app.dart';

class MultiPlataformaPage extends StatefulWidget {
  const MultiPlataformaPage({Key? key}) : super(key: key);

  @override
  State<MultiPlataformaPage> createState() => _MultiPlataformaPageState();
}

class _MultiPlataformaPageState extends State<MultiPlataformaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: AppBar(
              elevation: 0,
              backgroundColor: ColorsUtil.blue,
              title: const AppBarWidget(title: 'Multiplataforma'),
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
        const SizedBox(height: 16),
        _buildMultiplataforma()
      ],
    );
  }

  Widget _buildIntroducao() {
    return Column(
      children: [
        const Text(
          'O que é ser Multiplataforma?',
          style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        Row(
          children: [
            const Expanded(
                child: Text(
              'O flutter tem uma grande vantagem sobre outras tecnologias, que é ser multiplataforma. Um desenvolvedor flutter consegue programar para Android, IOS, web e até mesmo para desktop.',
              style: TextStyle(
                color: ColorsUtil.black,
                fontFamily: 'CaviarDreams',
              ),
            )),
            Image.asset(
              'assets/image/multiplataforma.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ],
        ),
        const Text(
          'Quando comparamos com outros frameworks, o flutter tem uma grande vantagem. '
          'O custo do Flutter geralmente é menor. '
          'Pois em alguns casos é preciso uma equipe de desenvolvimento IOS e outra equipe de desenvolvimento Android. '
          'E no caso do flutter não é preciso uma equipe específica para cada plataforma, diminuindo consideravelmente os custos. ',
          style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
          ),
        ),const SizedBox(height: 16),
        getBannerMid(AdmobBannerSize.BANNER),
      ],
    );
  }

  Widget _buildMultiplataforma() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Android',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(Icons.linear_scale),
            SizedBox(width: 8),
            Text(
              'IOS',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(Icons.linear_scale),
            SizedBox(width: 8),
            Text(
              'Web',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(Icons.linear_scale),
            SizedBox(width: 8),
            Text(
              'Desktop',
              style: TextStyle(fontFamily: 'Frederic', fontSize: 18),
            ),
          ],
        ),
        const Text(
          'Temos diferentes plataformas, diferentes sistemas operacionais e cada um desses sistemas operacionais exige que o desenvolvimento das aplicações seja em uma linguagem específica. '
          'Por exemplo IOS e Android. Ambos são \'mobile\' mas Android usa a linguagem Java e Kotlin, enquando o IOS usa o Swift.',
          style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
          ),
        ),
        const Text(
          'Com o flutter temos a possibilidade de programar apenas uma vez, apenas um código e terá a opção de gerar versões para ambos sistemas operacionais. '
          'Isso é ser multiplataforma.',
          style: TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
          ),
        ),
        Image.asset(
          'assets/image/flutterinho_ensinandos.png',
          width: 100,
        ),const SizedBox(height: 16),
        getBanner(AdmobBannerSize.BANNER),
      ],
    );
  }

  AdmobBanner getBannerMid(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/5624084584',
      adSize: size,
    );
  }

  AdmobBanner getBanner(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/1903744697',
      adSize: size,
    );
  }
}
