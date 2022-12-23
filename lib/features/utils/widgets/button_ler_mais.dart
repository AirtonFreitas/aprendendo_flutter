import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetContinuarLendo extends StatelessWidget {
  const WidgetContinuarLendo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: ColorsUtil.grayC,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context).reading,
              style: const TextStyle(
                  fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          const Icon(
            Icons.arrow_circle_down_sharp,
            size: 42,
          )
        ],
      ),
    );
  }
}
