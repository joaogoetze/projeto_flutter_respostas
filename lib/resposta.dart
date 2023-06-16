import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: TextButton.styleFrom(foregroundColor: Colors.blue, backgroundColor: Colors.white),
        child: Text(texto),
       onPressed: quandoSelecionado,
      ),
    );
  }
}