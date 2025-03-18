import 'package:cardiones/pages/pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardio-Nes',
      initialRoute: OpcionesPages.name,
      routes: {
        OpcionesPages.name: (context) => const OpcionesPages(),
        VistaUnoPages.routerName: (context) => const VistaUnoPages(),
        VistaDosPages.routerName: (context) => const VistaDosPages(),
        VistaTresPages.routeName: (context) => const VistaTresPages(),
        VistaCuatroPages.name: (context) => const VistaCuatroPages(),
      },
    );
  }
}
