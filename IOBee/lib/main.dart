
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/Pages/Home.dart';
import 'Pages/Estado.dart';
import 'Pages/Historico.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaActual=0;

  List<Widget> _paginas = [
    Home(),
    Estado(),
    Historico(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _paginaActual=index;
          });
        },
        currentIndex: _paginaActual,
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded),title: Text("Estado")),
            BottomNavigationBarItem(icon: Icon(Icons.assessment_rounded),title: Text("Histórico")),

          ]
      ),


      body:_paginas [_paginaActual],
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



  Widget _item(IconData icon, String name, int percentHum, int valueTemp, double value) {
    return ListTile(
      leading: Icon(icon, size: 32.0,),
      title: Text(name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
      ),
      subtitle: Column(
        children:[
          Text("$percentHum% of humidity", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,),),
          Text("$valueTemp° degrees Celsius", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,),),
        ],),

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
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) =>
            _item(FontAwesomeIcons.weight, "Weight", 15, 32, 145.12),
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.brown.withOpacity(0.15),
            height: 8.0,
          );
        },
      ),
    );
  }
}




