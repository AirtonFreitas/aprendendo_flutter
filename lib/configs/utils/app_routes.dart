import 'package:aprendendo_flutter/features/dart/dart_page.dart';
import 'package:aprendendo_flutter/features/gerencia_estado/gerencia_estado_page.dart';
import 'package:aprendendo_flutter/features/multiplataforma/multiplataforma_page.dart';
import 'package:aprendendo_flutter/features/onde_estudar/onde_estudar_page.dart';
import 'package:aprendendo_flutter/features/widgets/widgets_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_page.dart';
import '../../features/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'widgets':
        return MaterialPageRoute(builder: (_) => const WidgetsPage());
      case 'dart':
        return MaterialPageRoute(builder: (_) => const DartPage());
      case 'gerencia-estado':
        return MaterialPageRoute(builder: (_) => const GerenciaEstadoPage());
      case 'multiplataforma':
        return MaterialPageRoute(builder: (_) => const MultiPlataformaPage());
      case 'onde-estudar':
        return MaterialPageRoute(builder: (_) => const OndeEstudarPage());
      case 'apoie-desenvolvedor':
        return MaterialPageRoute(builder: (_) => const OndeEstudarPage());
      default:
        _erroRoute();
    }
    return null;
  }

  static Route<dynamic> _erroRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Text('ERROR'),
        ),
        body: Text('Page not Found'),
      );
    });
  }
}
