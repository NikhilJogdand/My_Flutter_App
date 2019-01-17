import 'package:basicrouting/pages/home_tabs/homeGridList/model/Item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/data.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/intro_page_item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/page_transformer.dart';
import 'package:basicrouting/ui/ListCardView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPageView extends StatefulWidget {
  @override
  State createState() => new IntroPageViewState();
}

class IntroPageViewState extends State<IntroPageView> {
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
    var _itemList = <Item>[
      Item(name: 'Wasing and Ironing', imageUrl: 'assets/wm/wash_machine.png'),
      Item(name: 'Ironing', imageUrl: 'assets/wm/iconfinder_Iron.png'),
      Item(name: 'Dry Cleaning', imageUrl: 'assets/wm/iconfinder__towel.png'),
      Item(name: 'Chemical Wash', imageUrl: 'assets/wm/iconfinder_Poison.png'),
      Item(name: 'Premium Laundry', imageUrl: 'assets/wm/premium_customer.png'),
      Item(name: 'Others', imageUrl: 'assets/wm/iconfinder_house.png'),
    ];

    return Scaffold(
        body: new ListView(
      children: <Widget>[
        _getPagerView(),
        _getTextView("Services"),
        Container(
          height: 475.0,
          child: new GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.9,
              padding: const EdgeInsets.all(9.0),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 50.0,
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
                  child: Container(
//                    padding: new EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: Image.asset(
                              _item.imageUrl,
                              height: 70.0,
                              width: 70.0,
                              fit: BoxFit.fill,
                              color: Color(getColorHexFromStr('#FB5B87')),
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
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("2 Days",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }).toList()),
        )
      ],
    ));
  }

  Widget _getTextView(text) => Container(
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
