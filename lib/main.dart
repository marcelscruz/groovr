import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SlidingUpPanel(
          controller: _pc,
          panel: Center(
            child: Text('Menu here!'),
          ),
          header: BottomNavBar(
            panelController: _pc,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text('Hey'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final PanelController panelController;

  BottomNavBar({@required this.panelController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          'Toggle Menu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          print('toggle menu');
          panelController.isPanelClosed
              ? panelController.open()
              : panelController.close();
        },
      ),
    );
  }
}
