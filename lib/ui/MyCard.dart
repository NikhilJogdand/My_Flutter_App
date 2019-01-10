import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  MyCard({
    this.tittle,
    this.icon
  });

  final Widget tittle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.00),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(10.0),
            child: new Column(           
                children: <Widget>[
                  this.tittle,
                  this.icon
                ],
            )
         ),
      ),
    );
  }
}