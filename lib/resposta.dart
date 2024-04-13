import 'package:flutter/material.dart';

// Essa classe é cada um dos botões de respostas
class Resposta extends StatelessWidget{

  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  // Widget do botão
  @override
  Widget build(BuildContext context)
  {
      return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue),
          child: Text(texto),
          onPressed: quandoSelecionado,
      ),
    );
  }
}