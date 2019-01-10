import 'package:flutter/material.dart';

class BackDropMenuPage extends StatefulWidget {
  @override
  _BackDropMenuPageState createState() => new _BackDropMenuPageState();
}

class _BackDropMenuPageState extends State<BackDropMenuPage> with SingleTickerProviderStateMixin {

  AnimationController controller;
  bool isPanelVisible() {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 100),value: 1.0);
  }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      controller.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("BackDrop Menu"),
        elevation: 0.0,
        leading: IconButton (
          onPressed: () {
            controller.fling(velocity: isPanelVisible() ? -1.0 : 1.0);
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller.view,
          ),
        ),
        ),
      body: TwoPanels(controller),
    );
  }
}

// Panel is used to show menu when visible to user on menu press.
class TwoPanels extends StatefulWidget {
  AnimationController controller;

  TwoPanels(this.controller);

  @override
  _TwoPanelsState createState() => new _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {

  static const headerHeight = 32.0;

  Widget bothPanel(BuildContext covariant,BoxConstraints constraints) {

  final ThemeData theme = Theme.of(context);

  return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: theme.primaryColor,
            child: Center(
              child: Text("BackPanel",style: TextStyle(fontSize: 24.0,color: Colors.white)),
            ),
          ),
          Material(
            elevation: 12.0,
            borderRadius: new BorderRadius.only(
              topLeft: new Radius.circular(16.0),
              topRight: new Radius.circular(16.0)
            ),
            child: Column(
                children: <Widget>[
                  Container(
                   height: headerHeight, 
                   child: Center(
                     child: Text("Menu 1", style: Theme.of(context).textTheme.button),
                   ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Front Panel",style: TextStyle(fontSize: 24.0,color: Colors.black)),
                    )
                  )
                ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
      builder: bothPanel,
    );
  }
}