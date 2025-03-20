import 'package:flutter/material.dart';

class CalcularCarbohidratos extends ChangeNotifier {
  double _carbohidratos = 0.0;

  double get carbohidratos => _carbohidratos;

  set carbohidratos(double value) {
    _carbohidratos = value;
    notifyListeners();
  }

  void calcularCarbohidratos(int cantidad, double carbohidratos) {
    _carbohidratos += cantidad * carbohidratos;
    notifyListeners();
  }

  void dosisInsulina(double insulina) {
    _carbohidratos = _carbohidratos / insulina;
    notifyListeners();
  }
}
