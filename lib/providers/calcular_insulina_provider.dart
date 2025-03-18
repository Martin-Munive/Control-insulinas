import 'package:flutter/material.dart';

class CalcularInsulinaProvider extends ChangeNotifier {
  double _ratio = 0;

  double get ratio => _ratio;

  void calcularRatio(double sensibilidad, double insulina) {
    if (insulina != 0) {
      _ratio = sensibilidad / insulina;
      notifyListeners();
    }
  }
}
