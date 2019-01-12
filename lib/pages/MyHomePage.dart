import 'dart:async';
import 'package:basicrouting/pages/home_tabs/Dashboard.dart';
import 'package:basicrouting/pages/home_tabs/GunsTabView.dart';
import 'package:basicrouting/pages/home_tabs/MissilesTabView.dart';
import 'package:basicrouting/pages/home_tabs/TanksTabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/MySecondPage.dart';
import '../ui/drawer.dart';
// import 'package:basicrouting/ui/drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static const String pageRouteName = "/MyHomePage";
  var iconColor = Colors.yellow;

  final String title;

  @override
  State<StatefulWidget> createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  var _tittle = "Laundry";

  int _selectedIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: new Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: new AppBar(
            title: new Text(_tittle,style: TextStyle(fontSize: 25,letterSpacing: 3,fontStyle: FontStyle.italic),), centerTitle: true, elevation: 7.0),
        drawer: new MyDrawer(), // Drawer Class instance is created.
        body: getSelectedView(context,_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: new Image.asset("assets/riffle.png"), title: Text('Guns')),
            BottomNavigationBarItem(
                icon:  new Image.asset("assets/missile.png"), title: Text('Missiles')),
            BottomNavigationBarItem(
                icon:  new Image.asset("assets/tank.png"), title: Text('Tanks')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),

      ),
    );
  }
}

getSelectedView(BuildContext context, int selectedIndex) {
  switch(selectedIndex) {
    case 0: {
     return new GunsTabView();
    }
    break;
    case 1: {
      return IntroPageView();// new MissilesTabView();
    }
    break;
    case 2: {
      return new TanksTabView();
    }
    break;

    default: {
      return new GunsTabView();
    }
    break;
  }
}
