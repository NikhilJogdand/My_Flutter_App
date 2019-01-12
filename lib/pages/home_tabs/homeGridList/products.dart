import 'package:basicrouting/main.dart';
import 'package:basicrouting/pages/home_tabs/homeGridList/model/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var _itemList = [
    Item(name: 'Wasing and Ironing', imageUrl: 'assets/wm/wash_machine.png'),
    Item(name: 'Ironing', imageUrl: 'assets/wm/iconfinder_Iron.png'),
    Item(name: 'Dry Cleaning', imageUrl: 'assets/wm/iconfinder__towel.png'),
    Item(name: 'Chemical Wash', imageUrl: 'assets/wm/iconfinder_Poison.png'),
    Item(name: 'Premium Laundry', imageUrl: 'assets/wm/premium_customer.png'),
    Item(name: 'Others', imageUrl: 'assets/wm/iconfinder_house.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[_gridCardItemView(0), _gridCardItemView(1)],
        ),
      )
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }

  _gridCardItemView(int index) => new Flexible(
          child: new Container(
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.cyan[100],
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
        margin: new EdgeInsets.all(5.0),
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(_itemList[index].imageUrl,
                height: 48.0, width: 48.0, color: Color(MyApp.themeColor)),
            Text(
              _itemList[index].name,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 18.0),
            ),
          ],
        ),
      ));
}
