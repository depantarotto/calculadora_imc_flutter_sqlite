import 'package:calculadora_imc_flutter/repository/configuracoes_repository.dart';
import 'package:calculadora_imc_flutter/services/info_service.dart';
import 'package:calculadora_imc_flutter/models/imc_model.dart';
import 'package:calculadora_imc_flutter/pages/lista_imc_page.dart';
import 'package:calculadora_imc_flutter/repository/imc_repository.dart';
import 'package:calculadora_imc_flutter/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.titulo});

  final String titulo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();

  final _listaImc = ImcRepository();

  ImcModel calcularIMC() {
    var imcCalculado = ImcModel(double.parse(_pesoController.text),
        double.parse(_alturaController.text));
    _listaImc.adicionaImc(imcCalculado);
    return imcCalculado;
  }

  carregarDados() async {
    var configuracoes = await ConfiguracoesRepository().getConfiguracoes();
    _alturaController.text = configuracoes.altura.toString();
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
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [
          Icon(Icons.calculate),
        ],
      ),
      drawer: const CustomDrawer(
        titulo: Info.titulo,
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.calculate,
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 256,
                  height: 64,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Peso",
                    ),
                    controller: _pesoController,
                  ),
                ),
                SizedBox(
                  width: 256,
                  height: 96,
                  child: TextField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Altura",
                    ),
                    controller: _alturaController,
                  ),
                ),
                SizedBox(
                  width: 256,
                  height: 48,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      double valorImc = 0;
                      if (_pesoController.text.isNotEmpty &&
                          _alturaController.text.isNotEmpty) {
                        valorImc = calcularIMC().imc;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Informe peso e altura")));
                        return;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext bc) {
                          return AlertDialog(
                            title: const Text("IMC"),
                            content: Text("IMC calculado: $valorImc"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      carregarDados();
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"))
                            ],
                          );
                        },
                      );
                      setState(() {
                        _pesoController.text = "";
                        _alturaController.text = "";
                      });
                    },
                    child: const Text("Calcular IMC"),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 256,
                  height: 48,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange[400],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListaImcPage(listagemImc: _listaImc)));
                    },
                    child: const Text("Mostrar Lista de IMC"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
