import 'package:calculadora_imc_flutter/repository/imc_repository.dart';
import 'package:flutter/material.dart';

class ListaImcPage extends StatelessWidget {
  const ListaImcPage({super.key, required this.listagemImc});

  final ImcRepository listagemImc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de IMCs"),
      ),
      body: ListView.builder(
          itemCount: listagemImc.listaImc.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text("Peso"),
                      Text(listagemImc.listaImc[index].peso.toString()),
                    ],
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Column(
                    children: [
                      const Text("Altura"),
                      Text(listagemImc.listaImc[index].altura.toString()),
                    ],
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Column(
                    children: [
                      const Text("IMC"),
                      Text(listagemImc.listaImc[index].imc.toStringAsFixed(2)),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
