import 'package:flutter/material.dart';

class CalculosProvider extends ChangeNotifier {
  double _resultado = 0;

  double get resultado => _resultado;

  void calcular(double glucosaActual, double glucosaMeta, double sensibilidad) {
    if (sensibilidad != 0) {
      _resultado = (glucosaActual - glucosaMeta) / sensibilidad;
      notifyListeners();
    }
  }
}
