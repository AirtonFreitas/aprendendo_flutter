import 'package:admob_flutter/admob_flutter.dart';
import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:aprendendo_flutter/features/utils/widgets/app_bar.dart';
import 'package:aprendendo_flutter/features/utils/widgets/drawer_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorsUtil.blue,
            title: AppBarWidget(title: AppLocalizations.of(context).titleApp),
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _widgetFlutter(),
        const Divider(),
        const SizedBox(height: 16),
        getBannerMid(AdmobBannerSize.BANNER),
        const SizedBox(height: 16),
        _widgetConteudo(),
        const SizedBox(height: 16),
        getBanner(AdmobBannerSize.BANNER),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _widgetFlutter() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).whatFlutter,
            style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
          ),
          Text(
            AppLocalizations.of(context).flutterDescription,
            style: const TextStyle(fontFamily: 'CaviarDreams', fontSize: 16),
          ),
          Text(
            AppLocalizations.of(context).flutterDescriptionTwo,
            style: const TextStyle(fontFamily: 'CaviarDreams', fontSize: 16),
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
          Text(
            AppLocalizations.of(context).whatsflutterLanguage,
            textAlign: TextAlign.start,
            style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
          ),
          Text(
            AppLocalizations.of(context).flutterLanguage,
            style: const TextStyle(fontFamily: 'CaviarDreams', fontSize: 16),
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
            text: TextSpan(
              text: AppLocalizations.of(context).nameDart,
              style: const TextStyle(
                  color: ColorsUtil.black,
                  fontFamily: 'CaviarDreams',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: AppLocalizations.of(context).dartDescript,
                  style: const TextStyle(
                      color: ColorsUtil.black,
                      fontFamily: 'CaviarDreams',
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context).nameFlutter,
              style: const TextStyle(
                  color: ColorsUtil.black,
                  fontFamily: 'CaviarDreams',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: AppLocalizations.of(context).flutterDescript,
                  style: const TextStyle(
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
        Text(
          AppLocalizations.of(context).whatLearn,
          style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        const SizedBox(
          height: 32,
        ),
        _temas(
          AppLocalizations.of(context).whatFlutter,
          'assets/image/flutter.png',
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'widgets'),
              child: _temas(AppLocalizations.of(context).whatWidgets,
                  'assets/image/widgets.png'),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'dart'),
              child: _temas(AppLocalizations.of(context).whatDart,
                  'assets/image/dart.png'),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'gerencia-estado'),
                child: _temas(AppLocalizations.of(context).whatState,
                    'assets/image/gerencia_estado.png')),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'multiplataforma'),
              child: _temas(AppLocalizations.of(context).whatMultiplatform,
                  'assets/image/multiplataforma.png'),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'onde-estudar'),
          child: _temas(
              AppLocalizations.of(context).learn, 'assets/image/pesquisa.png'),
        ),
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

  AdmobBanner getBannerMid(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/5651418014',
      adSize: size,
    );
  }

  AdmobBanner getBanner(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/5902204614',
      adSize: size,
    );
  }
}
