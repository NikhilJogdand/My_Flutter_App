import 'package:flutter/material.dart';
import '../pages/MySecondPage.dart';
import '../pages/BackDropMenuPage.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => new _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  
  final String _HEADER_TITTLE = "Header";
  final String _HOME_TITTLE = "Home";
  final String _FRIENDS_TITTLE = "Friends";
  final String _RELATIVES_TITTLE = "Relatives";
  final String _BACK_DROP_MENU_TITTLE = "Back Drop Menu";
  final String _LOGOUT_TITTLE = "Logout";
  final double _ICONS_SIZE = 35.00;
  var iconColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text("NJ"),
            ),
//            otherAccountsPictures: <Widget>[
//              new CircleAvatar(
//                backgroundColor: Colors.white70,
//              child: new Text("DJ"),
//              )
//            ],
            accountName: new Text("Nikhil Jogdand",style: new TextStyle(fontSize: 15.0)),
            accountEmail: new Text("1nikhiljogdand@gmail.com",style: new TextStyle(fontSize: 15.0))            
          ),
          // new DrawerHeader(
          //   child: new Container(
          //       color: Colors.orange,
          //       child: new Center(
          //         child: new Text(_HEADER_TITTLE),
          //       ),
          //   ),
          // ),
          new ListTile(
            leading: new Icon(Icons.home,size: _ICONS_SIZE,color: iconColor,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(MySecondPage.pageRouteName);
            },
            title: new Text(_HOME_TITTLE,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 15.00,
                  fontStyle: FontStyle.italic
                  ),
                ),
          ),
          new ListTile(
            leading: new Icon(Icons.child_friendly,size: _ICONS_SIZE,color: iconColor,),
            // onTap: ()=> Navigator.of(context)
            // // ..pop()
            // ..pushNamed(MySecondPage.pageRouteName),
            onTap: () {
                Navigator.of(context)..pop()..push(
                    new MaterialPageRoute(builder: (BuildContext context) => new MySecondPage()));        
            },
            title: new Text(_FRIENDS_TITTLE,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 15.00,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.face,size: _ICONS_SIZE,color: iconColor),
            onTap: () {
                Navigator.of(context)..pop()..push(
                    new MaterialPageRoute(builder: (BuildContext context) => new MySecondPage()));        
            },
            title: new Text(_RELATIVES_TITTLE,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 15.00,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.restaurant_menu,size: _ICONS_SIZE,color: iconColor),
            onTap: () {
                Navigator.of(context)..pop()..push(
                    new MaterialPageRoute(builder: (BuildContext context) => new BackDropMenuPage()));        
            },
            title: new Text(_BACK_DROP_MENU_TITTLE,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 15.00,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.exit_to_app,size: _ICONS_SIZE,color: iconColor),
            onTap: ()=> Navigator.of(context).pop(),
            trailing: new Icon(Icons.close),
            // ..pushNamed(MySecondPage.pageRouteName),
            title: new Text(_LOGOUT_TITTLE,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 15.00,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
        ],
      ),
    );
  }
}

