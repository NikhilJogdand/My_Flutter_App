import 'package:basicrouting/ui/ListCardView.dart';
import 'package:basicrouting/ui/MyCard.dart';
import 'package:flutter/material.dart';

class GunsTabView extends StatelessWidget {

  static const String pageRouteName = "/GunsTabView";

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.all(10.00),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new ListCardView("STK_BMCR",'assets/assults/Msbskandmsbsb.jpg',false),
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
      );
  }
}