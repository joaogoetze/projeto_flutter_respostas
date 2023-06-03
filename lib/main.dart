import 'package:flutter/material.dart';
import './questao.dart';

// Primeira coisa que é executada no app
void main()
{
  runApp(const MyApp());
}

class _PerguntasAppState extends State<MyApp>
{
    // Começa em 0 como padrão - 1º pergunta
    var _perguntaSelecionada = 0;

    // Quando o usuário clica em um botão de resposta
    // aciona essa função que muda a pergunta selecionada
    void _responder()
    {
      _perguntaSelecionada++;
      print(_perguntaSelecionada);
    }

    @override
    Widget build(BuildContext context) {

      // Lista de perguntas
      final List<String> perguntas =
      [
        'Qual a sua cor favorita?',
        'Qual o seu animal favorito?',
      ];

      // Padrão de estrutura do Flutter
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Pergutnas'),
          ),
          // Column server para que seja possível adicionar mais de um widget dentro de outro
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelecionada]),
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

  // Chama a classe no início do código que mostra as coisas na tela
    _PerguntasAppState createState()
    {
        return new _PerguntasAppState();
    }
}