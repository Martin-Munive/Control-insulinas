import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OpcionesPages extends StatelessWidget {
  static const String name = "/OpcionesPages";
  const OpcionesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            spacing: 40,
            children: [
              Logo(),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                children: [
                  ButtonNavigationIcon(
                    hero: '1',
                    icon: Icons.monitor_heart_rounded,
                    child: VistaUnoPages(),
                  ),
                  ButtonNavigationIcon(
                      hero: '2',
                      icon: Icons.coronavirus,
                      child: VistaDosPages()),
                  ButtonNavigationIcon(
                      icon: Icons.medical_services_rounded,
                      hero: '3',
                      child: VistaTresPages()),
                  ButtonNavigationIcon(
                      icon: Icons.medical_information_rounded,
                      hero: '4',
                      child: VistaCuatroPages()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
