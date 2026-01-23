import 'package:como_gasto/graph_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../month_widget.dart';


class Historico extends StatelessWidget{
  const Historico({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HistoricoPage(),
    );
  }

}

class HistoricoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  PageController _controller;
  int currentPage = 0;
  Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();

    _query= Firestore.instance
      .collection('datos')
      .where('Mes', isEqualTo: currentPage + 1)
      .snapshots();
    
    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4,
    );
  }

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
          _selector(),
          StreamBuilder<QuerySnapshot>(
            stream: _query,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data){
              if (data.hasData){
                return MonthWidget();
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          ),
          //_list(),
        ],
      ),
    );
  }


  Widget _selector() {
    return SizedBox.fromSize(
      size: Size.fromHeight(70.0),
      child: PageView(
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
          });
        },
        controller: _controller,
        children: <Widget>[
          _pageItem("Enero", 0),
          _pageItem("Febrero", 1),
          _pageItem("Marzo", 2),
          _pageItem("Abril", 3),
          _pageItem("Mayo", 4),
          _pageItem("Junio", 5),
          _pageItem("Julio", 6),
          _pageItem("Agosto", 7),
          _pageItem("Septiembre", 8),
          _pageItem("Octubre", 9),
          _pageItem("Noviembre", 10),
          _pageItem("Diciembre", 11),
        ],
      ),
    );
  }



  Widget _pageItem(String name, int position) {
    var _alignment;
    final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.brown,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.brown.withOpacity(0.4),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }

    return Align(
      alignment: _alignment,
      child: Text(name,
        style: position == currentPage ? selected : unselected,
      ),
    );
  }


}