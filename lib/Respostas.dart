import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  Respostas(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onSelecao,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
        ),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
