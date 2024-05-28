import 'package:calculadora_imc_flutter/models/imc_model.dart';
import 'package:calculadora_imc_flutter/repository/imc_repository.dart';
import 'package:flutter/material.dart';

class ListaImcPage extends StatefulWidget {
  const ListaImcPage({super.key});

  @override
  State<ListaImcPage> createState() => _ListaImcPageState();
}

class _ListaImcPageState extends State<ListaImcPage> {
  final ImcRepository imcRepo = ImcRepository();
  List<ImcModel> listaImc = <ImcModel>[];

  @override
  void initState() {
    obterDados();
    super.initState();
  }

  void obterDados() async {
    listaImc = await imcRepo.listaImc;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de IMCs"),
      ),
      body: ListView.builder(
          itemCount: listaImc.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text("Peso"),
                      Text(listaImc[index].peso.toString()),
                    ],
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Column(
                    children: [
                      const Text("Altura"),
                      Text(listaImc[index].altura.toString()),
                    ],
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Column(
                    children: [
                      const Text("IMC"),
                      Text(listaImc[index].imc.toStringAsFixed(2)),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
