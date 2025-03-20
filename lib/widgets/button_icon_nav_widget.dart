import 'package:cardiones/design/design.dart';
import 'package:cardiones/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ButtonNavigationIcon extends StatelessWidget {
  final IconData icon;
  final Widget child;
  final String hero;
  final String nombre;

  const ButtonNavigationIcon({
    super.key,
    required this.icon,
    required this.child,
    required this.hero,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.18, // 18% del ancho de la pantalla
      height: size.width * 0.18, // Mantiene proporción cuadrada
      child: FloatingActionButton(
        onPressed: () {
          RouteTransition(
            context: context,
            child: child,
            animation: AnimationType.fadeIn,
            duration: const Duration(seconds: 1),
            replacement: true,
          );
        },
        heroTag: hero,
        elevation: 5,
        backgroundColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra icono y texto
          children: [
            Icon(
              icon,
              color: ColorExacto.colorBlanco,
              size: size.width * 0.08, // Ajusta tamaño del icono
            ),
            SizedBox(height: 4), // Espaciado entre icono y texto
            Text(
              nombre,
              style: TextStyle(
                color: ColorExacto.colorBlanco,
                fontSize: size.width * 0.035, // Ajusta tamaño del texto
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
