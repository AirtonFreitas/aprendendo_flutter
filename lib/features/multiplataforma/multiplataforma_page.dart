import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../configs/utils/colors_utils.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/drawer_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MultiPlataformaPage extends StatefulWidget {
  const MultiPlataformaPage({Key? key}) : super(key: key);

  @override
  State<MultiPlataformaPage> createState() => _MultiPlataformaPageState();
}

class _MultiPlataformaPageState extends State<MultiPlataformaPage> {

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
                  title: AppLocalizations.of(context).nameMultiplatform),
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
        Text(
          AppLocalizations.of(context).whatMultiplatform,
          style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              AppLocalizations.of(context).multplatformIntroduction,
              style: const TextStyle(
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
        Text(
          AppLocalizations.of(context).multplatformDescription,
          style: const TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
          ),
        ),
        const SizedBox(height: 16),
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
        Text(
          AppLocalizations.of(context).multplatformDescriptionTwo,
          style: const TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
          ),
        ),
        Text(
          AppLocalizations.of(context).multplatformConclude,
          style: const TextStyle(
            color: ColorsUtil.black,
            fontFamily: 'CaviarDreams',
          ),
        ),
        Image.asset(
          'assets/image/flutterinho_ensinandos.png',
          width: 100,
        ),
        const SizedBox(height: 16),
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
