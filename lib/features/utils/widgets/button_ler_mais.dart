import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/home_page_store.dart';

final _homeStore = HomePageStore();

class WidgetContinuarLendo extends StatelessWidget {
  const WidgetContinuarLendo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: ColorsUtil.grayC,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Continuar lendo...',
              style: TextStyle(
                  fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold)),
          SizedBox(width: 16),
          Icon(Icons.arrow_circle_down_sharp)
        ],
      ),
    );
  }
}
