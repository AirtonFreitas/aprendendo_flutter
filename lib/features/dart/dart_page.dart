import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:in_app_review/in_app_review.dart';
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
              title:
                  AppBarWidget(title: AppLocalizations.of(context).titleDart),
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
          controller: scrollController,
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
          children: [
            const Icon(Icons.sticky_note_2_outlined),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context).syntaxTitle,
              style: const TextStyle(fontFamily: 'Frederic', fontSize: 20),
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
        Text(
          AppLocalizations.of(context).nameDart,
          style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).introduction,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context).dartDescription,
                style: const TextStyle(
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
        Text(
          AppLocalizations.of(context).dartEvolution,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 6),
        Text(
          AppLocalizations.of(context).firstSee,
          style: const TextStyle(
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
            Text(AppLocalizations.of(context).variables,
                style: const TextStyle(
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
        Text(
          AppLocalizations.of(context).variablesCreate,
          style: const TextStyle(
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
        Text(
          AppLocalizations.of(context).variableDynamic,
          style: const TextStyle(fontFamily: 'CaviarDreams'),
        ),
        Text(
          AppLocalizations.of(context).variableCreateType,
          style: const TextStyle(fontFamily: 'CaviarDreams'),
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
        Text(
          AppLocalizations.of(context).rememberingVariable,
          style: const TextStyle(fontFamily: 'CaviarDreams'),
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
            Text(AppLocalizations.of(context).variablesConst,
                style: const TextStyle(
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
        Text(
          AppLocalizations.of(context).variablesConstCreate,
          style: const TextStyle(fontFamily: 'CaviarDreams'),
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
          Text(AppLocalizations.of(context).ifAndElseTitle,
              style: const TextStyle(
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
      Text(
        AppLocalizations.of(context).ifAndElseExample,
        style: const TextStyle(fontFamily: 'CaviarDreams'),
      ),
      Text(
        AppLocalizations.of(context).ifAndElseConditions,
        style: const TextStyle(fontFamily: 'CaviarDreams'),
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
          Text(AppLocalizations.of(context).forTitle,
              style: const TextStyle(
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
      Text(
        AppLocalizations.of(context).forExample,
        style: const TextStyle(fontFamily: 'CaviarDreams'),
      ),
      Text(
        AppLocalizations.of(context).forDescription,
        style: const TextStyle(fontFamily: 'CaviarDreams'),
      ),
      const SizedBox(height: 16),
      RichText(
        text: TextSpan(
            text: AppLocalizations.of(context).forVariableControl,
            style: const TextStyle(
                color: Colors.indigoAccent,
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              const TextSpan(text: ', ', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: AppLocalizations.of(context).forConditions,
                  style: const TextStyle(color: Colors.green)),
              TextSpan(
                  text: AppLocalizations.of(context).forAnd,
                  style: const TextStyle(color: Colors.black)),
              TextSpan(
                  text: AppLocalizations.of(context).forIncrementVariable,
                  style: const TextStyle(color: Colors.amber)),
              TextSpan(
                  text: AppLocalizations.of(context).forDescriptionT,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal)),
              TextSpan(
                  text: AppLocalizations.of(context).forCode,
                  style: const TextStyle(color: Colors.purpleAccent)),
              TextSpan(
                  text: AppLocalizations.of(context).forRepet,
                  style: const TextStyle(
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
          Text(AppLocalizations.of(context).switchTitle,
              style: const TextStyle(
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
      Text(AppLocalizations.of(context).switchDescription,
          style: const TextStyle(
            fontFamily: 'CaviarDreams',
          )),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(16),
        color: ColorsUtil.grayDark,
        child: RichText(
          text: TextSpan(
              text: 'switch ',
              style: const TextStyle(color: Colors.orange, fontFamily: 'Hack'),
              children: <TextSpan>[
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchState,
                    style: const TextStyle(color: Colors.blue)),
                const TextSpan(
                    text: ') {', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n   case \'MG\':',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchMG,
                    style: const TextStyle(color: Colors.green)),
                const TextSpan(
                    text: ');', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n   case \'AC\':',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchAC,
                    style: const TextStyle(color: Colors.green)),
                const TextSpan(
                    text: ');', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n   case \'AL\':',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchAL,
                    style: const TextStyle(color: Colors.green)),
                const TextSpan(
                    text: ');', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n   case \'RJ\':',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchRJ,
                    style: const TextStyle(color: Colors.green)),
                const TextSpan(
                    text: ');', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n   case \'SC\':',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchSC,
                    style: const TextStyle(color: Colors.green)),
                const TextSpan(
                    text: ');', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n   break;',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n   default:',
                    style: TextStyle(color: Colors.orange)),
                const TextSpan(
                    text: '\n    print',
                    style: TextStyle(color: Colors.cyanAccent)),
                const TextSpan(
                    text: '(', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: AppLocalizations.of(context).switchDefault,
                    style: const TextStyle(color: Colors.green)),
                const TextSpan(
                    text: ');', style: TextStyle(color: Colors.white)),
                const TextSpan(
                    text: '\n  }', style: TextStyle(color: Colors.white)),
              ]),
        ),
      ),
      const SizedBox(height: 16),
      Text(AppLocalizations.of(context).switchExample,
          style: const TextStyle(
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
