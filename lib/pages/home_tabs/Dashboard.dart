import 'package:basicrouting/pages/home_tabs/homeGridList/products.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/data.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/intro_page_item.dart';
import 'package:basicrouting/pages/home_tabs/pagerItems/page_transformer.dart';
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
    return Scaffold(
        body: new ListView(
      children: <Widget>[
        _getPagerView(),
        _getTextView("Services"),
        Container(
          height: 475.0,
          child: Products(),
        )
      ],
    ));
  }

  Widget _getTextView(text) => Container(
    margin: EdgeInsets.fromLTRB(20.0,10.0,0.0,0.0),
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
