import 'package:calculadora_imc_flutter/models/configuracoes_model.dart';
import 'package:calculadora_imc_flutter/repository/configuracoes_repository.dart';
import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final _nomeUsuarioController = TextEditingController();
  final _emailUsuarioController = TextEditingController();
  final _alturaController = TextEditingController();

  void salvarConfiguracoes() {
    var configuracoesRepo = ConfiguracoesRepository();
    var configuracoes = ConfiguracoesModel(_nomeUsuarioController.text,
        _emailUsuarioController.text, double.parse(_alturaController.text));
    configuracoesRepo.salvar(configuracoes);
  }

  void carregarDados() async {
    var configuracoes = await ConfiguracoesRepository().getConfiguracoes();
    setState(() {
      _nomeUsuarioController.text = configuracoes.nomeUsuario;
      _emailUsuarioController.text = configuracoes.emailUsuario;
      _alturaController.text = configuracoes.altura.toString();
    });
  }

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        actions: [
          IconButton(
              onPressed: () {
                salvarConfiguracoes();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Nome de Usuário",
                ),
                controller: _nomeUsuarioController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "E-mail de Usuário",
                ),
                controller: _emailUsuarioController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Altura",
                ),
                controller: _alturaController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
