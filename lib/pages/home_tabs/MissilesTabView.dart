import 'package:basicrouting/ui/MyCard.dart';
import 'package:flutter/material.dart';

class MissilesTabView extends StatelessWidget {

  static const String pageRouteName = "/MissilesTabView";

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.all(10.00),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new MyCard(
                tittle : new Text("M416",
                  style: new TextStyle(fontSize: 25.0),),
                icon : new Icon(Icons.favorite,size: 40.0,color: Colors.red,),
              ),
              new MyCard(
                  tittle : new Text("M762",
                      style: new TextStyle(fontSize: 25.0)),
                  icon : new Icon(Icons.hearing,size: 40.0,color: Colors.green)
              ),
              new MyCard(
                  tittle : new Text("Mk14",
                      style: new TextStyle(fontSize: 25.0)),
                  icon : new Icon(Icons.visibility,size: 40.0,color: Colors.pinkAccent)
              )
            ],
          ),
        ),
      );
  }
}