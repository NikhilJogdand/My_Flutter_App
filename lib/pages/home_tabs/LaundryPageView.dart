import 'package:basicrouting/pages/home_tabs/homeGridList/model/Item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/Gridmodel.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/HomeScreenDataModel.dart';
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

  _getPagerView(List<IntroItem> sampleItems) => new SizedBox(
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
    double width = queryData.size.width;
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
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: <Widget>[
            _getPagerView(sampleItems),
            _getTextView("Services"),
            _getGridViewMenu(_itemList, queryData, textTheme),
            _getTextView("Today's Deal"),
            _getPagerView(sampleItems2),
          ],
        ),
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

class GridItem extends StatelessWidget {
  GridModel gridModel;

  GridItem(this.gridModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          border: new Border.all(
            color: Colors.pink[100],
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  gridModel.imagePath,
                  width: 30,
                  height: 30,
                  color: gridModel.color,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    gridModel.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_getGridViewMenu(
    List<Item> _itemList, MediaQueryData queryData, TextTheme textTheme) {
  double width = queryData.size.width;

  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 6.0,top: 6),
    child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        childAspectRatio: 1.3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: _itemList.map((Item _item) {
          return Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: new Border.all(
                color: Colors.pink[100],
                width: 1.5,
                style: BorderStyle.solid,
              ),
            ),
            child: Container(
              color: Colors.white,
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

