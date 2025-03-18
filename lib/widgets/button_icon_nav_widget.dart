import 'package:cardiones/design/design.dart';
import 'package:cardiones/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ButtonNavigationIcon extends StatelessWidget {
  final IconData icon;
  final Widget child;
  final String hero;

  const ButtonNavigationIcon(
      {super.key, required this.icon, required this.child, required this.hero});

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
      child: Icon(
        icon,
        color: ColorExacto.colornnegroLetras,
      ),
    );
  }
}
