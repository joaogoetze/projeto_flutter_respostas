import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{

  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  // Get que retorna uma frase dependendo do resultado final
  String get fraseResultado
  {
      if(pontuacao < 8)
      {
          return 'Parabéns';
      }
      else if(pontuacao < 15)
      {
          return 'Excelente';
      }
      else
      {
          return 'Perfeito';
      }
  }

  // Wiget que mostra a frase de resultado
  // e o botão de reiniciar
  @override
  Widget build(BuildContext context){
    return Column(
      // Deixa o widget no centro da tela
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Center(
          child: Text(fraseResultado,
          style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: reiniciarQuestionario,
            child: Text('Jogar novamente?'),
            style: TextButton.styleFrom(backgroundColor: Colors.white, primary: Colors.blue))
      ],
    );
  }
}