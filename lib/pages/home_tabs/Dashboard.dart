import 'package:basicrouting/pages/home_tabs/homeGridList/model/Item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/data.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/intro_page_item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/page_transformer.dart';
import 'package:basicrouting/ui/ListCardView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaundryPageView extends StatefulWidget {
  @override
  State createState() => new LaundryPageViewState();
}

class LaundryPageViewState extends State<LaundryPageView> {
  MediaQueryData queryData;
  static onTap(index) {
    print("$index selected.");
  }

  _getPagerView() => new SizedBox(
        width: double.infinity,
        height: 250,
        child: Center(
          child: Stack(fit: StackFit.expand, children: <Widget>[
            PageTransformer(
              pageViewBuilder: (context, visibilityResolver) {
                return PageView.builder(
                  controller: PageController(viewportFraction: .85),
                  itemCount: sampleItems.length,
                  itemBuilder: (context, index) {
                    final item = sampleItems[index];
                    final pageVisibility =
                        visibilityResolver.resolvePageVisibility(index);

                    return IntroPageItem(
                      item: item,
                      pageVisibility: pageVisibility,
                    );
                  },
                );
              },
            ),
          ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    var _itemList = <Item>[
      Item(name: 'Wasing and Ironing', imageUrl: 'assets/wm/wash_machine.png'),
      Item(name: 'Ironing', imageUrl: 'assets/wm/iconfinder_Iron.png'),
      Item(name: 'Dry Cleaning', imageUrl: 'assets/wm/iconfinder__towel.png'),
      Item(name: 'Chemical Wash', imageUrl: 'assets/wm/iconfinder_Poison.png'),
      Item(name: 'Premium Laundry', imageUrl: 'assets/wm/premium_customer.png'),
      Item(name: 'Others', imageUrl: 'assets/wm/iconfinder_house.png'),
    ];

    return Scaffold(
        body: SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          _getPagerView(),
          _getTextView("Services"),
          _getGridViewMenu(_itemList, queryData, textTheme),
          _getTextView("Today's Deal"),
//          _getDeals(context),
        ],
      ),
    ));
  }
}

_getTextView(text) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
    child: Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontStyle: FontStyle.italic,
        letterSpacing: 2.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

_getGridViewMenu(
    List<Item> _itemList, MediaQueryData queryData, TextTheme textTheme) {
  double width = queryData.size.width;
  double height = queryData.size.height;

  return Container(
    height: 800.0,
    child: new GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: _itemList.map((Item _item) {
          return Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: new Border.all(
                color: Colors.grey[350],
                width: 3.0,
                style: BorderStyle.solid,
              ),
            ),
            margin: const EdgeInsets.all(15.0),
            child: Container(
//                    padding: new EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                      flex: 2,
                      child: Container(
                        margin: new EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                        child: Image.asset(
                          _item.imageUrl,
                          height: width / 8,
                          width: width / 8,
                          fit: BoxFit.fill,
                          color: Color(getColorHexFromStr('#FB5B87')),
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        margin: new EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _item.name,
                              style: textTheme.subtitle,
                            ),
                            Text("2 Days", style: textTheme.body1)
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        }).toList()),
  );
}

_getDeals(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  double _width = width * 0.65;

  return ListView(
    // This next line does the trick.
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
        width: 160.0,
        color: Colors.red,
      ),
      Container(
        width: 160.0,
        color: Colors.blue,
      ),
      Container(
        width: 160.0,
        color: Colors.green,
      ),
      Container(
        width: 160.0,
        color: Colors.yellow,
      ),
      Container(
        width: 160.0,
        color: Colors.orange,
      ),
    ],
  );
}
