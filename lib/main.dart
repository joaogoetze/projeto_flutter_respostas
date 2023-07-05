import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

// Primeira coisa que é executada no app
void main()
{
  runApp(const MyApp());
}

class _PerguntasAppState extends State<MyApp>
{
    // Começa em 0 como padrão - 1º pergunta
    var _perguntaSelecionada = 0;

    // Lista de perguntas do tipo Map
    // A String representa as perguntas, que são apenas texto
    // o Object representa uma lista
    final List<Map> _perguntas = const
    [
      {
        // chave e valor
        'texto': 'Qual a sua cor favorita?',
        //respostas
        'respostas': ['Vermelho','Azul','Amarelo','Verde']
      },
      {
        //chave e valor
        'texto': 'Qual o seu animal favorito?',
        'respostas': ['Leão', 'Onça', 'Tigre', 'Guepardo']
      },
      {
        //chave e valor
        'texto': 'Qual seu carro favorito?',
        'respostas': ['Ferrari', 'Lamborgini', 'Bugatti', 'BMW']
      }
    ];

    // Quando o usuário clica em um botão de resposta
    // aciona essa função que muda a pergunta selecionada
    void _responder()
    {
      if(temPerguntaSelecionada)
        {
          setState(() {
            _perguntaSelecionada++;
          });
        }

      print("Foi clicado em uma resposta");

      print(_perguntaSelecionada);
    }

    bool get temPerguntaSelecionada
    {
      return _perguntaSelecionada < _perguntas.length;
    }

    @override
    Widget build(BuildContext context) {



      // Lista que tem as reposta ali de cima
      // Se tiver pergunta selecionada, pega as respostas, senão: renderiza uma tela nula
      List<String> respostas = temPerguntaSelecionada
      ? _perguntas[_perguntaSelecionada]['respostas']
      : [];

      //Uma lista, que carrega valores do tipo Widget
      // Transforma o texto recebido em um componente/widget do tipo resposta
      List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();


      // Padrão de estrutura do Flutter
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Pergutnas'),
          ),
          // Column server para que seja possível adicionar mais de um widget dentro de outro
          body: temPerguntaSelecionada ? Column(
            children: <Widget>[
              Questao(_perguntas[_perguntaSelecionada]['texto']),
              ...widgets,
            ],
          ): null,
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