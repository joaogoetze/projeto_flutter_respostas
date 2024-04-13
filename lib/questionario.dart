import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget
{

    final List<Map<String, Object>> perguntas;
    final int perguntaSelecionada;
    final void Function(int) responder;

    Questionario({
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder,
    });

    // Valor que é acessado na funcao responder, que retorna
    // positivo caso o índice da lista seja menor que o tamanho
    // da lista, e negativo caso contrário
    bool get temPerguntaSelecionada
    {
      return perguntaSelecionada < perguntas.length;
    }

    @override
    Widget build(BuildContext context)
    {
        // Se o retrono do "temPerguntaSelecionada" for positivo
        // Mostra a questão
        // Caso contrário, não faz nada
        List<Map<String,Object>> respostas = temPerguntaSelecionada
            ? perguntas[perguntaSelecionada].cast()['respostas']
            : [];
        return Column(
          children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['texto'].toString()),
          ...respostas.map((resp){
                return Resposta(
                    resp['texto'] as String,
                    () => responder(int.parse(resp['pontuacao'].toString())),
                );
                }).toList(),
        ],
      );
    }
}