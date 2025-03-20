import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculosProvider()),
        ChangeNotifierProvider(create: (_) => CalcularInsulinaProvider()),
        ChangeNotifierProvider(create: (_) => CalcularCarbohidratos()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
