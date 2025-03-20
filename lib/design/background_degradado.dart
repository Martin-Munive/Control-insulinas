import 'package:cardiones/design/design.dart';
import 'package:flutter/material.dart';

class BackGroundDegradado {
  final BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
    colors: [ColorExacto.colorFondoAzul, ColorExacto.colorTopAzul],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ));
}
