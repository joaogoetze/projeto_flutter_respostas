import 'package:flutter/material.dart';

// Primeira coisa que é executada no app
void main()
{
  runApp(const MyApp());
}

class _PerguntasAppState extends State<MyApp>
{
    var _perguntaSelecionada = 0;

    void _responder()
    {
      _perguntaSelecionada++;
      print(_perguntaSelecionada);
    }

    @override
    Widget build(BuildContext context) {

      final List<String> perguntas =
      [
        'Qual a sua cor favorita?',
        'Qual o seu animal favorito?',
      ];

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Pergutnas'),
          ),
          // Column server para que seja possível adicionar mais de um widget dentro de outro
          body: Column(
            children: <Widget>[
              Text(perguntas[perguntaSelecionada]),
              ElevatedButton(
                child: Text('Resposta 1'),
                onPressed: _responder,
              ),
              ElevatedButton(
                child: Text('Resposta 2'),
                onPressed: _responder,
              ),
              ElevatedButton(
                child: Text('Resposta 3'),
                onPressed: _responder,
              ),
            ],
          ),
        ),

      );
    }
}

// O "extends StatelessWidget" é o que torna a classe "MyApp" em widget
class MyApp extends StatefulWidget
{
  // Não sei o que isso faz
  const MyApp({super.key});

    _PerguntasAppState createState()
    {
        return new _PerguntasAppState();
    }

}