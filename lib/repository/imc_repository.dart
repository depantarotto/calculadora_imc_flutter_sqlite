import 'package:calculadora_imc_flutter/models/imc_model.dart';

class ImcRepository {
  final List<ImcModel> _listaImc = [];

  void adicionaImc(ImcModel imc) {
    _listaImc.add(imc);
  }

  List<ImcModel> get listaImc => _listaImc;
}
