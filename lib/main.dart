import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testes',
      home: Principal(title: 'Multiplos Contadores Independentes'),
    );
  }
}

class Principal extends StatelessWidget {
  Principal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Contadores(),
      ),
    );
  }
}

class Contadores extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadoresState();
}

class _ContadoresState extends State<Contadores> {
  List<Contador> _contadores = new List();

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Contadores'),
            Text(_contadores.length.toString()),
            RaisedButton(
              child: Text('Novo'),
              onPressed: () {
                setState(() {
                  _contadores.add(new Contador(_contadores.length+1));
                });
              },
            ),
            RaisedButton(
              child: Text('Limpar'),
              onPressed: () {
                setState(() {
                  _contadores.clear();
                });
              },
            ),
          ]
        ),
        Column(
          children: _contadores.map((contador) => Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: contador,
            )
          )).toList()
        ),
      ],
    );
  }
}

class Contador extends StatefulWidget {
  int identificador;

  Contador(int identificador){
    //_quantidadeInstancias++;
    this.identificador = identificador;
  }
  
  @override
  State<StatefulWidget> createState() => _ContadorState(identificador);

  /*
  static int _quantidadeInstancias = 0;
  
  static void zerarInstancias(){
    _quantidadeInstancias = 0;
  }

  static int  obterQuantidadeInstancias(){
    return _quantidadeInstancias;
  }
  */
}

class _ContadorState extends State<Contador> {
  String _nome = 'Contador ';
  int _contagem = 0;

  _ContadorState(int identificador){
    //_nome += Contador.obterQuantidadeInstancias().toString();
    _nome += identificador.toString();
  }

  void _incrementar() {
    setState(() {
      _contagem++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          _nome,
        ),
        Text(
          _contagem.toString(),
        ),
        RaisedButton(
          child: Text('Incrementar'),
          onPressed: (){
            _incrementar();
          },
        )
      ],
    );
  }
}
