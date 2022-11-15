import 'package:aprendendo_flutter/configs/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorsUtil.white,
      centerTitle: true,
      title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      color: ColorsUtil.black,
                      fontFamily: 'Frederic',
                      fontSize: 20)),
            ],
          )),
    );
  }
}
