import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';

class OpcionesPages extends StatelessWidget {
  static const String name = "/OpcionesPages";

  const OpcionesPages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtiene tamaño de pantalla

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Logo(),
                SizedBox(height: 20), // Espaciado extra
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Evita doble scroll
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio:
                      size.width / (size.height * 0.6), // Ajuste dinámico
                  children: [
                    _buildButton(context, '1', LucideIcons.syringe,
                        'Calcular Insulina', VistaUnoPages()),
                    _buildButton(context, '2', LucideIcons.utensils,
                        'Carbohidratos', VistaDosPages()),
                    _buildButton(context, '3', LucideIcons.candyOff,
                        'Nice-Sugar', VistaTresPages()),
                    _buildButton(context, '4', Icons.list_alt_rounded,
                        'Referencias', VistaCuatroPages()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String hero, IconData icon,
      String nombre, Widget child) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2, // Ajusta según el alto de la pantalla
      child: ButtonNavigationIcon(
        hero: hero,
        icon: icon,
        nombre: nombre,
        child: child,
      ),
    );
  }
}
