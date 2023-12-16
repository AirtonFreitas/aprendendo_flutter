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

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
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
                AppBarWidget(title: AppLocalizations.of(context).nameWidgets),
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
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildIntroducao(),
        Row(
          children: [
            const Icon(Icons.widgets_outlined),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context).widgetsLayoutTitle,
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
        _homeStore.clickAd ? _buildExemplo() : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildIntroducao() {
    return Column(children: [
      Text(
        AppLocalizations.of(context).whatWidgets,
        style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
      ),
      Row(
        children: [
          Flexible(
            child: Text(
              AppLocalizations.of(context).widgetsIntroduction,
              style: const TextStyle(
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
      Text(AppLocalizations.of(context).widgetsCategoryTitle,
          style: const TextStyle(fontFamily: 'Frederic', fontSize: 16)),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(AppLocalizations.of(context).widgetsLayout,
              style: const TextStyle(fontFamily: 'Frederic', fontSize: 24)),
          Text(AppLocalizations.of(context).widgetsInterface,
              style: const TextStyle(fontFamily: 'Frederic', fontSize: 24))
        ],
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text(AppLocalizations.of(context).widgetsLayoutDescription,
                style: const TextStyle(
                  fontFamily: 'CaviarDreams',
                )),
          ),
          Flexible(
            child:
                Text(AppLocalizations.of(context).widgetsInterfaceDescription,
                    style: const TextStyle(
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
      _buildScaffold(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      _buildContainer(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      getBannerMid(AdmobBannerSize.BANNER),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
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
          Text(
            AppLocalizations.of(context).widgetsInterfacetTitle,
            style: const TextStyle(fontFamily: 'Frederic', fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ],
      ),
      const SizedBox(height: 16),
      _buildText(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      _buildImage(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      _buildIcon(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      _buildButton(),
      const SizedBox(height: 32),
      const Divider(),
      Text(
        AppLocalizations.of(context).widgetsDescription,
        style: const TextStyle(fontFamily: 'CaviarDreams'),
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 16),
      getBanner(AdmobBannerSize.BANNER),
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
        Text(AppLocalizations.of(context).widgetsScaffoldDescription,
            style: const TextStyle(
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
        Text(AppLocalizations.of(context).widgetsScaffoldDescriptionTwo,
            style: const TextStyle(
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
        Text(AppLocalizations.of(context).widgetScaffoldReceived,
            style: const TextStyle(
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
            Expanded(
              child: Text(AppLocalizations.of(context).widgetContainerIntro,
                  style: const TextStyle(
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
              child: Text(AppLocalizations.of(context).widgetContentContainer),
            ),
            Text(
              style: const TextStyle(fontFamily: 'Hack', fontSize: 12),
              'Container('
              '\n width: 70,'
              '\n height: 70,'
              '\n color: Colors.green,'
              '\n child: '
              '\n   Text(${AppLocalizations.of(context).widgetContentContainer}),'
              '\n);',
            ),
          ],
        ),
        Text(AppLocalizations.of(context).widgetExample,
            style: const TextStyle(
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
            Text('Column${AppLocalizations.of(context).forAnd}Row',
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
        Text(AppLocalizations.of(context).widgetColumns,
            style: const TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        Row(
          children: [
            Image.asset(
              'assets/image/row_column.png',
              width: 200,
            ),
            Expanded(
              child: Text(AppLocalizations.of(context).widgetColumnsDescription,
                  style: const TextStyle(
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
            Expanded(
                child: Text(
              style: const TextStyle(fontFamily: 'Hack', fontSize: 12),
              'Column('
              '\n children: ['
              '\n   Text(\'${AppLocalizations.of(context).fisrt}\'),'
              '\n   Text(\'${AppLocalizations.of(context).second}\'),'
              '\n   Text(\'${AppLocalizations.of(context).third}\'),'
              '\n ],'
              '\n),',
            )),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: Column(
                children: [
                  Text(AppLocalizations.of(context).fisrt),
                  Text(AppLocalizations.of(context).second),
                  Text(AppLocalizations.of(context).third),
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
            Expanded(
                child: Text(
              style: const TextStyle(fontFamily: 'Hack', fontSize: 12),
              'Row('
              '\n children: ['
              '\n   Text(\'${AppLocalizations.of(context).fisrt}\'),'
              '\n   Text(\'${AppLocalizations.of(context).second}\'),'
              '\n   Text(\'${AppLocalizations.of(context).third}\'),'
              '\n ],'
              '\n),',
            )),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: Row(
                children: [
                  Text(AppLocalizations.of(context).fisrt),
                  Text(AppLocalizations.of(context).second),
                  Text(AppLocalizations.of(context).third),
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
            Text(AppLocalizations.of(context).widgetImagesTitle,
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
        Text(AppLocalizations.of(context).widgetImagesDescription,
            style: const TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        Text(
            style: const TextStyle(
              fontFamily: 'Hack',
            ),
            'Image.network(\'${AppLocalizations.of(context).widgetImageUrl}\'),'
            '\nImage.asset(\'${AppLocalizations.of(context).widgetImageLocal}\')'),
        const SizedBox(height: 16),
        Text(AppLocalizations.of(context).widgetImageExample,
            style: const TextStyle(
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
              color: Colors.white,
              child: Image.asset(
                'assets/image/aprendendo_sql.png',
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
            Text(AppLocalizations.of(context).widgetTextTitle,
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
        Text(AppLocalizations.of(context).widgetTextDescription,
            style: const TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text(\'${AppLocalizations.of(context).widgetTest}\'),',
                style: const TextStyle(
                  fontFamily: 'Hack',
                )),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(2),
              color: Colors.green,
              child: Text(AppLocalizations.of(context).widgetTest),
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
            Text(AppLocalizations.of(context).widgetIconsTitle,
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
        Text(AppLocalizations.of(context).widgetIconsDescription,
            style: const TextStyle(
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
            Text(AppLocalizations.of(context).widgetButtonsTitle,
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
        Text(AppLocalizations.of(context).widgetButtonsDescription,
            style: const TextStyle(
              fontFamily: 'CaviarDreams',
            )),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
                child: Text(
                    'TextButton('
                    '\n onPressed: (){FUNÇÃO}, '
                    '\n child: Text(\'${AppLocalizations.of(context).widgetButtonSend}\')'
                    '\n)',
                    style: const TextStyle(
                      fontFamily: 'Hack',
                    ))),
            TextButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context).widgetButtonSend)),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  AdmobBanner getBannerMid(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/2997921243',
      adSize: size,
    );
  }

  AdmobBanner getBanner(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/9036129255',
      adSize: size,
    );
  }

  Future<void> _showInterstitial() async {
    _homeStore.setClickAd();
    interstitialAd.show();
  }
}
