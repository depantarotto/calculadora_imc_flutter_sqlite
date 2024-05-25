import 'dart:math';

class ImcModel {
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;

  ImcModel(this._peso, this._altura) {
    _peso = peso;
    _altura = altura;
    _imc = peso / (pow(altura, 2));
  }

  double get peso => _peso;

  double get altura => _altura;

  double get imc => _imc;
}
