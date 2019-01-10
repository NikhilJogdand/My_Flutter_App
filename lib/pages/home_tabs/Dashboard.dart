import 'package:basicrouting/pages/home_tabs/homeGridList/ItemList.dart';
import 'package:basicrouting/pages/home_tabs/homeGridList/model/Item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/data.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/intro_page_item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/page_transformer.dart';
import 'package:flutter/material.dart';

class IntroPageView extends StatefulWidget {
  @override
  State createState() => new IntroPageViewState();
}

class IntroPageViewState extends State<IntroPageView> {
  final _controller = new PageController(viewportFraction: 0.5);

  static onTap(index) {
    print("$index selected.");
  }

  getPagerView() => new SizedBox(
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          getPagerView(),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10.0),
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                _getTextView("Services"),
                _gridView(),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _getTextView(text) => Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontStyle: FontStyle.italic,
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: _itemList.map(
            (Item) => ItemList(item: Item),
          )
          .toList(),
    );
  }

  get _itemList => [
        Item(
            name: 'Wasing and Ironing', imageUrl: 'assets/wm/wash_machine.png'),
        Item(name: 'Ironing', imageUrl: 'assets/wm/iconfinder_Iron.png'),
        Item(name: 'Dry Cleaning', imageUrl: 'assets/wm/iconfinder__towel.png'),
        Item(
            name: 'Chemical Wash', imageUrl: 'assets/wm/iconfinder_Poison.png'),
        Item(
            name: 'Premium Laundry',
            imageUrl: 'assets/wm/premium_customer.png'),
        Item(name: 'Others', imageUrl: 'assets/wm/iconfinder_house.png'),
      ];
}
