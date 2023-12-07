import 'package:flutter/material.dart';

void main() {
  runApp(PerguntandoApp());
}

class _PerguntandoAppState extends State<PerguntandoApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    // ignore: avoid_print
    print('Pergunta Respondida!: $_perguntaSelecionada');
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = ['qual sua cor favorita?', 'qual seu animal favorito?'];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text(
              'Vascão',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          body: Column(
            children: <Widget>[
              Text(perguntas[_perguntaSelecionada],
                  style: const TextStyle(color: Colors.red)),
              ElevatedButton(
                  onPressed: _responder, child: const Text('Marrom')),
              ElevatedButton(
                  onPressed: _responder, child: const Text('Vermelho')),
              ElevatedButton(onPressed: _responder, child: const Text('Verde'))
            ],
          ),
        ));
  }
}

class PerguntandoApp extends StatefulWidget {
  State<PerguntandoApp> createState() {
    return _PerguntandoAppState();
  }
}
