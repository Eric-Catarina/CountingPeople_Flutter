import 'package:flutter/material.dart';

void main() {
  runApp(AplicativoDoEric());
}

class AplicativoDoEric extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MinhaHomePage(),
    );
  }
}

class MinhaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://wallpaperaccess.com/full/797185.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: ContainerCentral(),
          ),
        ));
  }
}

class ContainerCentral extends StatefulWidget {
  @override
  State<ContainerCentral> createState() => _ContainerCentralState();
}

class _ContainerCentralState extends State<ContainerCentral> {

  String situacaoDoLab = "Chega Mais !!!";

  int _quantidadeAlunos = 1;

  void _AcrescentarAlunos(){
    setState(() {
      _quantidadeAlunos++;
      if(_quantidadeAlunos > 0 && _quantidadeAlunos < 36){
        situacaoDoLab = "Chega Mais !!!";
      }

      if(_quantidadeAlunos > 36){
        situacaoDoLab = "Tá lotado !!!";
      }
    });
  }

  void _DecrementarAlunos(){
    setState(() {
      _quantidadeAlunos--;
      if(_quantidadeAlunos < 0){
        situacaoDoLab = "IMPOSSÍVEL !!!";
      }
      if(_quantidadeAlunos < 36 && _quantidadeAlunos > 0){
        situacaoDoLab = "Chega Mais !!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Alunos: ",
              style: TextStyle(color: Colors.white, fontSize: 34),
            ),
            Text(
              '$_quantidadeAlunos',
              style: TextStyle(color: Colors.white, fontSize: 34),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.deepPurple,

                ),
                onPressed: _AcrescentarAlunos,

                child:
                Icon(
                    Icons.add
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.deepPurple, // foreground
                ),
                onPressed: _DecrementarAlunos,
                child: Text('-',
                  style: TextStyle(fontSize: 30),),
              ),
            )
          ],
        ),
        Text(

          "$situacaoDoLab",
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.italic, fontSize: 34),
        )
      ],
    );
  }
}