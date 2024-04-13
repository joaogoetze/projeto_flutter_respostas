import 'package:flutter/material.dart';

// Elemento "Questão", que é a pergunta no topo da tela
class Questao extends StatelessWidget
{

    final String texto;

    Questao(this.texto);

    @override
    Widget build(BuildContext context)
    {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text(
            texto,
            style: TextStyle(fontSize: 28, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        );
    }
}