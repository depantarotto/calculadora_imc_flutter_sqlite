import 'package:calculadora_imc_flutter/models/configuracoes_model.dart';
import 'package:calculadora_imc_flutter/services/prefs_service.dart';

class ConfiguracoesRepository {
  static PrefsService prefs = PrefsService();

  void salvar(ConfiguracoesModel configuracoes) {
    prefs.setNomeUsuario(configuracoes.nomeUsuario);
    prefs.setEmailUsuario(configuracoes.emailUsuario);
    prefs.setAltura(configuracoes.altura);
  }

  Future<ConfiguracoesModel> getConfiguracoes() async {
    return ConfiguracoesModel(await prefs.getNomeUsuario(),
        await prefs.getEmailUsuario(), await prefs.getAltura());
  }
}
