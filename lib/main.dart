import 'package:flutter/material.dart';
import 'configs/utils/app_routes.dart';
import 'configs/utils/colors_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprendendo Flutter',
      theme: ThemeData(
          fontFamily: 'Heavitas',
          primaryColor: ColorsUtil.black,
          accentColor: ColorsUtil.black,
          primarySwatch: Colors.green,
          buttonTheme: const ButtonThemeData(
            buttonColor: ColorsUtil.black,
            textTheme: ButtonTextTheme.accent,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(fontFamily: 'Heavitas'))),
      initialRoute: 'splash',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
