// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(",", ".")) ?? 0.0;
    double precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(",", ".")) ?? 0.0;
    if (precoAlcool == 0.0 || precoGasolina == 0.0) {
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0";
      });
    } else {
      //Se o preço do álcool dividido pelo preço da gasolina for >= a 0.7 é
      // melhor abastecer com gasolina senão é melhor utilizar álcool
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Álcool";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset("assets/image/logo.png"),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "Saiba qual a melhor opção para o abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                controller: _controllerAlcool,
                decoration: InputDecoration(
                  labelText: "Preço Álcool, ex 2.49",
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _controllerGasolina,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex 8.77",
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
                onPressed: _calcular,
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ))),
      ),
    );
  }
}
