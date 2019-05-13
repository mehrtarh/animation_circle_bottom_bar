import 'package:flutter/material.dart';
import 'package:circle_bottombar/animation_circle_bottom_bar.dart';
import 'package:circle_bottombar/tab_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  CircularBottomNavigationController _navigationController =
      new CircularBottomNavigationController(2);
  String _text = "test";

  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = List.of([
      new TabItem(Icons.person_outline, Colors.red.shade100),
      new TabItem(Icons.lightbulb_outline, Colors.red.shade200),
      new TabItem(Icons.home, Colors.red.shade300),
      new TabItem(Icons.phone_locked, Colors.red.shade400),
      new TabItem(Icons.person_outline, Colors.red.shade500),
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Tab Bar Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(_text),
          ],
        ),
      ),
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        selectedCallback: (int selectedPos) {
          setState(() {
            _text = "text " + selectedPos.toString();
          });
//          _navigationController.value = selectedPos;
          print("clicked on $selectedPos");
        },
        controller: _navigationController,
        barBackgroundColor: Colors.black,
        normalIconColor: Colors.red.shade900,
        iconsSize: 24,
        selectedIconColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        circleStrokeWidth: 5,
        circleStrokeColor: Color(0xFF680200),
        barShadowSize: 2.0,
        barLineColor: Colors.red.shade900,
        barLineSize: 2.0,
        barShowLine: true,
      ),
    );
  }
}
