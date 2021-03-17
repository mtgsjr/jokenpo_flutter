import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override  
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  void _SelecaoUsuario(String selecao){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];
    print("Escolha do Usuario: "+selecao);
    print("Escolha do App: "+numero.toString());
    if (escolhaApp=="pedra"){
      setState(() {
        this._imagemApp = AssetImage("images/pedra.png");
      });
    } else if (escolhaApp=="papel"){
      setState(() {
        this._imagemApp = AssetImage("images/papel.png");
      });
    } else {
      setState(() {
        this._imagemApp = AssetImage("images/tesoura.png");
      });
    }
    if (selecao==escolhaApp){
      setState(() {
        this._mensagem="EMPATE! Jogue novamente.";
      });
    } else {
      if (selecao=="pedra" && escolhaApp=="tesoura"){
        setState(() {
          this._mensagem = "Você ganhou: Pedra quebra tesoura!";
        });
      }
      if (selecao=="pedra" && escolhaApp=="papel"){
        setState(() {
          this._mensagem = "Você perdeu: Papel enrrola pedra!";
        });
      }
      if (selecao=="papel" && escolhaApp=="tesoura"){
        setState(() {
          this._mensagem = "Você perdeu: Tesoura corta papel!";
        });
      }
      if (selecao=="papel" && escolhaApp=="pedra"){
        setState(() {
          this._mensagem = "Você ganhou: Papel enrrola a pedra!";
        });
      }
      if (selecao=="tesoura" && escolhaApp=="papel"){
        setState(() {
          this._mensagem = "Você ganhou: Tesoura corta papel!";
        });
      }
      if (selecao=="tesoura" && escolhaApp=="pedra"){
        setState(() {
          this._mensagem = "Você perdeu: Tesoura não corta Pedra!";
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Jogo da Pedra, Papel ou Tesoura"),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:32, bottom: 16),
          child: Text(
            "A Inteligência Artificial escolheu:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image(image: this._imagemApp, height: 100),
        Padding(
          padding: EdgeInsets.only(top:32, bottom: 16),
          child: Text(
            this._mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () => _SelecaoUsuario("pedra"),
              child: Image.asset("images/pedra.png", height: 100),
            ),
            GestureDetector(
              onTap: () => _SelecaoUsuario("papel"),
              child: Image.asset("images/papel.png", height: 100),
            ),
            GestureDetector(
              onTap: () => _SelecaoUsuario("tesoura"),
              child: Image.asset("images/tesoura.png", height: 100),
            )
            ],
        ),
      ],
    ),
    );
  }
}
