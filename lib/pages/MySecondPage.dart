import 'package:flutter/material.dart';
import '../ui/MyCard.dart';

class MySecondPage extends StatelessWidget {

  static const String pageRouteName = "/MySecondPage";

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text("Second Page")),
        body: new Container(
          padding: new EdgeInsets.all(10.00),
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new MyCard(
                   tittle : new Text("Heart",
                    style: new TextStyle(fontSize: 25.0),),
                   icon : new Icon(Icons.favorite,size: 40.0,color: Colors.red,),
                ),
                new MyCard(
                   tittle : new Text("Ear",
                    style: new TextStyle(fontSize: 25.0)),
                   icon : new Icon(Icons.hearing,size: 40.0,color: Colors.green)
                ),
                new MyCard(
                   tittle : new Text("Visiblity",
                    style: new TextStyle(fontSize: 25.0)),
                   icon : new Icon(Icons.visibility,size: 40.0,color: Colors.pinkAccent)
                )
              ],
            ),
          ),
        ),
      );
    }
  }