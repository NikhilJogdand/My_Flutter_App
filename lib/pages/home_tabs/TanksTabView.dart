import 'package:basicrouting/ui/MyCard.dart';
import 'package:flutter/material.dart';

class TanksTabView extends StatelessWidget {

  static const String pageRouteName = "/TanksTabView";

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.all(10.00),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new MyCard(
                tittle : new Text("Tanks2020",
                  style: new TextStyle(fontSize: 25.0),),
                icon : new Icon(Icons.favorite,size: 40.0,color: Colors.red,),
              ),
              new MyCard(
                  tittle : new Text("Tanks1664",
                      style: new TextStyle(fontSize: 25.0)),
                  icon : new Icon(Icons.hearing,size: 40.0,color: Colors.green)
              ),
              new MyCard(
                  tittle : new Text("Tanks3021",
                      style: new TextStyle(fontSize: 25.0)),
                  icon : new Icon(Icons.visibility,size: 40.0,color: Colors.pinkAccent)
              )
            ],
          ),
        ),
      );
  }
}