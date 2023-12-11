import 'package:flutter/material.dart';
import 'questao.dart';
import 'Respostas.dart';

void main() {
  runApp(const PerguntandoApp());
}

class _PerguntandoAppState extends State<PerguntandoApp> {
  var _perguntaSelecionada = 0;
  final List perguntas = const [
    {
      'texto': 'qual sua cor favorita?',
      'Respostas': ['Marrom', 'Vermelho', 'Preto', 'Branco']
    },
    {
      'texto': 'qual seu animal favorito?',
      'Respostas': ['Cachorro', 'Gato', 'Cavalo', 'Vaca']
    },
    {
      'texto': 'Qual seu time do coração?',
      'Respostas': ['Corinthians', 'Vasco', 'Palmeiras', 'Santos']
    }
  ];
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String>? respostas = temPerguntaSelecionada
        ? perguntas[_perguntaSelecionada]['Respostas']
        : null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Perguntando App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: temPerguntaSelecionada
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Questao(perguntas[_perguntaSelecionada]['texto']),
                  const SizedBox(height: 16.0),
                  if (respostas != null)
                    ...respostas.map((t) => Respostas(t, _responder)).toList(),
                ],
              )
            : null,
      ),
    );
  }
}

class PerguntandoApp extends StatefulWidget {
  const PerguntandoApp({super.key});

  @override
  State<PerguntandoApp> createState() {
    return _PerguntandoAppState();
  }
}
