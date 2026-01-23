
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Estado extends StatelessWidget{
  const Estado({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: EstadoPage(),
    );
  }

}

class EstadoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _EstadoPageState();
}

class _EstadoPageState extends State<EstadoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }


  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.amber.withOpacity(0.15),
            height: 24.0,
          ),
          _list(),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String name, double value) {
    return ListTile(
      leading: Icon(icon, size: 30.0,),
      title: Text(name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$value",
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ),
      ),

    );
  }

  Widget _list() {
    return Expanded(
      child: ListView(
    children: <Widget>[
          _item(FontAwesomeIcons.weight,"Weight",145),
          _item(FontAwesomeIcons.thermometerEmpty,"Temperature",24),
          _item(FontAwesomeIcons.water,"Humidity",18),
        ]
      ),
    );
  }
}