import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/image/logo.png"),
            )
          ],
        ))),
      ),
    );
  }
}
