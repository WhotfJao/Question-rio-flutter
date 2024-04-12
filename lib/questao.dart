import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {required TextStyle textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(70),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
