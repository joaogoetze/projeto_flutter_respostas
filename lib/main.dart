import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

// Primeira coisa que é executada no app
void main()
{
  //Essa const está lá no final do código
  runApp(const MyApp());
}

class _PerguntasAppState extends State<MyApp>
{
    var _perguntaSelecionada = 0;
    var _pontucaoTotal = 0;

    // Lista que tem Maps(chave e valor), com as perguntas e respostas
    // Também possui os valores de cada resposta
    final List<Map<String, Object>> _perguntas = const
    [
      {
        // chave e valor
        //Perguntas
        'texto': 'Qual a sua cor favorita?',
        //respostas
        'respostas':
        [
          {'texto': 'Vermelho', 'pontuacao': 10},
          {'texto': 'Azul', 'pontuacao': 5},
          {'texto': 'Verde', 'pontuacao': 3},
          {'texto': 'Amarelo', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual o seu animal favorito?',
        'respostas':
        [
          {'texto': 'Leão', 'pontuacao': 10},
          {'texto': 'Onça', 'pontuacao': 5},
          {'texto': 'Tigre', 'pontuacao': 3},
          {'texto': 'Guepardo', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual seu carro favorito?',
        'respostas':
        [
          {'texto': 'Ferrari', 'pontuacao': 10},
          {'texto': 'Lamborgini', 'pontuacao': 5},
          {'texto': 'Bugatti', 'pontuacao': 3},
          {'texto': 'BMW', 'pontuacao': 1},
        ],
      }
    ];

    // Quando o usuário clica em uma resposta, essa função é invocada
    void _responder(int pontuacao)
    {
      // Se a lista de perguntas está no seu indice válido,
      // o estado da aplicação é alterado, com o indice da
      // lista de pergutnas sendo acrescido para passar para
      // a próxima questão
        if(temPerguntaSelecionada)
        {
            setState(()
            {
              _perguntaSelecionada++;
              _pontucaoTotal += pontuacao;
            });
        }
    }

    // Essa função reinicia o questionário de forma simples,
    // alterando o índice da lista de perguntas e a pontuação
    void reiniciarQuestionario()
    {
        setState(()
        {
            _perguntaSelecionada = 0;
            _pontucaoTotal = 0;
      });
    }

    // Valor que é acessado na funcao responder, que retorna
    // positivo caso o índice da lista seja menor que o tamanho
    // da lista, e negativo caso contrário
    bool get temPerguntaSelecionada
    {
      return _perguntaSelecionada < _perguntas.length;
    }

    //Widget principal, é toda a tela basicamente
    @override
    Widget build(BuildContext context)
    {
        // Padrão de estrutura do Flutter
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
            ),
            // Corpo da aplicação
            body: temPerguntaSelecionada
                // Se o retrono do "temPerguntaSelecionada" for positivo
                // Chama a classe Questionário que mostra as questões
                // Caso contrário, vai para a classe "resultado"
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder,
                )
                // Chama a classe resulato, passando como parâmetro
                // a função que mostra a pontuação e que reinicia o questionario
                : Resultado(_pontucaoTotal, reiniciarQuestionario),
        ),
      );
    }
}

// O "extends StatefulWidget" é o que torna a classe "MyApp" um widget
class MyApp extends StatefulWidget
{
    // Não sei o que isso faz
    const MyApp({super.key});

    // Chama a classe no início do código que mostra os elementos na tela
    _PerguntasAppState createState()
    {
        // O return em Flutter é como se fosse um print, mostrando as coisas na tela
        // Esse elemento retornado é a base do código
        return new _PerguntasAppState();
    }
}