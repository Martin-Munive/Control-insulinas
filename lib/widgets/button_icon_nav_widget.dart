import 'package:cardiones/design/design.dart';
import 'package:cardiones/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ButtonNavigationIcon extends StatelessWidget {
  final IconData icon;
  final Widget child;
  final String hero;
  final String nombre;

  const ButtonNavigationIcon(
      {super.key,
      required this.icon,
      required this.child,
      required this.hero,
      required this.nombre});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          RouteTransition(
            context: context,
            child: child,
            animation: AnimationType.fadeIn,
            duration: Duration(seconds: 1),
            replacement: true,
          );
        },
        heroTag: hero,
        elevation: 5,
        backgroundColor: Colors.blue,
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Icon(
                icon,
                color: ColorExacto.colorBlanco,
                size: 40,
              ),
              Text(
                nombre,
                style: TextStyle(
                    color: ColorExacto.colorBlanco,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
