import 'package:flutter/material.dart';
import 'questao.dart';
import 'Respostas.dart';
import 'notaResposta.dart';
import 'nota.dart';
void main() {
  runApp(const PerguntandoApp());
}

class _PerguntandoAppState extends State<PerguntandoApp> {
  var _perguntaSelecionada = 0;
 final List<Map<String, dynamic>> perguntas =  [
    {
      'texto': 'qual sua cor favorita?',
      'Respostas': [
        Resposta('Marrom', 'Nota 1'),
        Resposta('Vermelho', 'Nota 2'),
        Resposta('Preto', 'Nota 3'),
        Resposta('Branco', 'Nota 4'),
      ]
    },
    {
      'texto': 'qual seu animal favorito?',
      'Respostas': [
        Resposta('Cachorro', 'Nota 5'),
        Resposta('Gato', 'Nota 6'),
        Resposta('Cavalo', 'Nota 7'),
        Resposta('Vaca', 'Nota 8'),
      ]
    },
    {
      'texto': 'Qual seu time do coração?',
      'Respostas': [
        Resposta('Corinthians', 'Nota 9'),
        Resposta('Vasco', 'Nota 10'),
        Resposta('Palmeiras', 'Nota 11'),
        Resposta('Santos', 'Nota 12'),
      ]
    }
  ];

  List<String> notasFinais = []; // Lista para armazenar as notas finais

  void _responder(String nota) {
    setState(() {
      notasFinais.add(nota); // Adiciona a nota à lista de notas finais
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  void _voltarPergunta() {
    setState(() {
      if (_perguntaSelecionada > 0) {
        _perguntaSelecionada--;
      }
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Resposta>? respostas = temPerguntaSelecionada
        ? perguntas[_perguntaSelecionada]['Respostas']
        : null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            if (_perguntaSelecionada > 0)
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _voltarPergunta,
              ),
          ],
          title: const Text(
            'Questionário',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: temPerguntaSelecionada
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Questao(
                    perguntas[_perguntaSelecionada]['texto'],
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  if (respostas != null)
                    ...respostas
                        .map((r) => Respostas(
                              r.texto,
                              () => _responder(r.nota), // Passa a nota para _responder
                              buttonStyle: ElevatedButton.styleFrom(
                                iconColor: Colors.blueAccent,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                        .toList(),
                ],
              )
            : TelaFinal(notas: notasFinais), // Navega para a tela final
      ),
    );
  }
}

class PerguntandoApp extends StatefulWidget {
  const PerguntandoApp({Key? key}) : super(key: key);

  @override
  State<PerguntandoApp> createState() {
    return _PerguntandoAppState();
  }
}
