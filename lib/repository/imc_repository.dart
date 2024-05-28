import 'package:calculadora_imc_flutter/models/imc_model.dart';
import 'package:calculadora_imc_flutter/repository/sqlite_database.dart';

class ImcRepository {
  final List<ImcModel> _listaImc = [];

  void _adicionaImc(ImcModel imc) {
    _listaImc.add(imc);
  }

  Future<List<ImcModel>> get listaImc async {
    var db = await SqliteDatabase().obterDataBase();
    var result =
        await db.rawQuery("SELECT id, peso, altura from tab_dados_imc");
    for (var element in result) {
      _adicionaImc(
        ImcModel(double.parse(element["peso"].toString()),
            double.parse(element["altura"].toString())),
      );
    }
    return _listaImc;
  }

  Future<void> salvar(ImcModel imcModel) async {
    var db = await SqliteDatabase().obterDataBase();
    await db.rawInsert('INSERT INTO tab_dados_imc(peso, altura) values (?, ?)',
        [imcModel.peso, imcModel.altura]);
  }
}
