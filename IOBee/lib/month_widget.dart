
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'graph_widget.dart';



class MonthWidget extends StatefulWidget{
  @override
  _MonthWidgetState createState() => _MonthWidgetState();

}

class _MonthWidgetState extends State<MonthWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _weight(),
        Container(
            color: Colors.amber.withOpacity(0.15),
            height: 20.0),
        _graph(),
        Container(
            color: Colors.amber.withOpacity(0.15),
            height: 30.0),

      ]
    );
  }
}
Widget _weight() {
  return  Column(
    children: <Widget>[
      Text("145,12",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
          color: Colors.brown,
        ),
      ),
      Text("Actual weight",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.amber,
        ),
      ),
    ],

  );
}

Widget _graph() {
  return Container(
    //color: Colors.amber.withOpacity(0.15),
    height: 400.0,
    child: GraphWidget(),
  );
}

