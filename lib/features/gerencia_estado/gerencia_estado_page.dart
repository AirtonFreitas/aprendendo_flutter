import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../configs/utils/colors_utils.dart';
import '../home/home_page_store.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/button_ler_mais.dart';
import '../utils/widgets/drawer_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _homeStore = HomePageStore();

class GerenciaEstadoPage extends StatefulWidget {
  const GerenciaEstadoPage({Key? key}) : super(key: key);

  @override
  State<GerenciaEstadoPage> createState() => _GerenciaEstadoPageState();
}

class _GerenciaEstadoPageState extends State<GerenciaEstadoPage> {
  late AdmobInterstitial interstitialAd;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        requestReview();
      }
    });

    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: 'ca-app-pub-3721429763641925/1395983395',
    );
    interstitialAd.load();
  }

  requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: AppBar(
              elevation: 0,
              backgroundColor: ColorsUtil.blue,
              title: AppBarWidget(
                  title: AppLocalizations.of(context).nameManagementState),
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
        body: SingleChildScrollView(controller: scrollController,
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
      Text(
        AppLocalizations.of(context).detail,
        style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),
      const SizedBox(height: 16),
      getBannerMid(AdmobBannerSize.BANNER),
      const SizedBox(height: 16),
      _homeStore.clickAd == false
          ? GestureDetector(
              child: const WidgetContinuarLendo(),
              onTap: () => _showInterstitial())
          : const SizedBox.shrink(),
      const SizedBox(height: 16),
      _homeStore.clickAd ? _detalhamento() : const SizedBox.shrink(),
    ]);
  }

  Widget _buildIntroducao() {
    return Column(children: [
      Text(
        AppLocalizations.of(context).nameManagementState,
        style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),
      Text(
        AppLocalizations.of(context).managementStateDescription,
        style: const TextStyle(
          fontFamily: 'CaviarDreams',
        ),
      ),
      Image.asset('assets/image/mobx_triad.png'),
      Text(
        AppLocalizations.of(context).managementStateElements,
        style: const TextStyle(
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
            Expanded(
              child: Text(
                AppLocalizations.of(context).managementStateExample,
                style: const TextStyle(
                  fontFamily: 'CaviarDreams',
                ),
              ),
            )
          ],
        ),
        Text(
          AppLocalizations.of(context).managementStateExampleTwo,
          style: const TextStyle(
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
                text: TextSpan(
                    text: 'double ',
                    style: const TextStyle(
                        color: Colors.orange, fontFamily: 'Hack'),
                    children: <TextSpan>[
                      TextSpan(
                          text: AppLocalizations.of(context).balance,
                          style: const TextStyle(color: Colors.indigoAccent)),
                      const TextSpan(
                          text: ' = ', style: TextStyle(color: Colors.white)),
                      const TextSpan(
                          text: '632.00',
                          style: TextStyle(color: Colors.lightBlue)),
                      const TextSpan(
                          text: ';', style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).functionDescription,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: TextSpan(
                text: AppLocalizations.of(context).receivedDeposit,
                style:
                    const TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                children: <TextSpan>[
                  const TextSpan(
                      text: '(', style: TextStyle(color: Colors.white)),
                  const TextSpan(text: ' double'),
                  TextSpan(
                      text: AppLocalizations.of(context).valueDeposit,
                      style: const TextStyle(color: Colors.cyanAccent)),
                  const TextSpan(
                      text: '){\n ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' + ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).valueDeposit,
                      style: const TextStyle(color: Colors.cyanAccent)),
                  const TextSpan(
                      text: ';', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).valueInput,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: TextSpan(
                text: AppLocalizations.of(context).receivedDeposit,
                style:
                    const TextStyle(color: Colors.orange, fontFamily: 'Hack'),
                children: <TextSpan>[
                  const TextSpan(
                      text: '(', style: TextStyle(color: Colors.white)),
                  const TextSpan(text: ' double'),
                  const TextSpan(
                      text: ' 50.00 ',
                      style: TextStyle(color: Colors.cyanAccent)),
                  const TextSpan(
                      text: '){\n ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' + ', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: ' 50.00',
                      style: TextStyle(color: Colors.cyanAccent)),
                  const TextSpan(
                      text: ';', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).newBalance,
          style: const TextStyle(
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
                      text: TextSpan(
                          text: AppLocalizations.of(context).balance,
                          style: const TextStyle(
                              color: Colors.indigoAccent, fontFamily: 'Hack'),
                          children: const <TextSpan>[
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
        Text(
          AppLocalizations.of(context).managementStateError,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        getBannerMid(AdmobBannerSize.BANNER),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).exampleMobx,
          style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: TextSpan(
                text: '@observable ',
                style:
                    const TextStyle(color: Colors.yellow, fontFamily: 'Hack'),
                children: <TextSpan>[
                  const TextSpan(
                      text: '\ndouble ',
                      style: TextStyle(color: Colors.orange)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' = ', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: '632.00',
                      style: TextStyle(color: Colors.lightBlue)),
                  const TextSpan(
                      text: ';', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).mobxDescription,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          color: ColorsUtil.grayDark,
          child: RichText(
            text: TextSpan(
                text: '@action\n',
                style:
                    const TextStyle(color: Colors.yellow, fontFamily: 'Hack'),
                children: <TextSpan>[
                  TextSpan(
                      text: AppLocalizations.of(context).receivedDeposit,
                      style: const TextStyle(color: Colors.orange)),
                  const TextSpan(
                      text: '(', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: ' double', style: TextStyle(color: Colors.orange)),
                  const TextSpan(
                      text: ' 50.00 ',
                      style: TextStyle(color: Colors.cyanAccent)),
                  const TextSpan(
                      text: '){\n ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' = ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: AppLocalizations.of(context).balance,
                      style: const TextStyle(color: Colors.indigoAccent)),
                  const TextSpan(
                      text: ' + ', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: ' 50.00',
                      style: TextStyle(color: Colors.cyanAccent)),
                  const TextSpan(
                      text: ';', style: TextStyle(color: Colors.white)),
                  const TextSpan(
                      text: '\n}', style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).mobxDescriptionTwo,
          style: const TextStyle(
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
                      text: TextSpan(
                          text: AppLocalizations.of(context).balance,
                          style: const TextStyle(
                              color: Colors.indigoAccent, fontFamily: 'Hack'),
                          children: const <TextSpan>[
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
        Text(
          AppLocalizations.of(context).managementStateConclude,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
        getBanner(AdmobBannerSize.BANNER),
      ],
    );
  }

  AdmobBanner getBannerMid(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/3830575046',
      adSize: size,
    );
  }

  AdmobBanner getBanner(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/5025318785',
      adSize: size,
    );
  }

  Future<void> _showInterstitial() async {
    _homeStore.setClickAd();
    interstitialAd.show();
  }
}
