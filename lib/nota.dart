import 'package:flutter/material.dart';

class TelaFinal extends StatelessWidget {
  final List<String> notas;

  const TelaFinal({Key? key, required this.notas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas Finais'),
      ),
      body: ListView.builder(
        itemCount: notas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Resposta ${index + 1}'),
            subtitle: Text(notas[index]),
          );
        },
      ),
    );
  }
}
