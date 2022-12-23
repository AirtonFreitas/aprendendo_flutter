import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, 'home');
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset('assets/animations/flutter_logo.json',
              width: MediaQuery.of(context).size.width * 0.7, fit: BoxFit.fill),
          Text(
            AppLocalizations.of(context).titleApp,
            style: const TextStyle(fontFamily: 'Frederic', fontSize: 18),
          )
        ]),
      ),
    );
  }
}
