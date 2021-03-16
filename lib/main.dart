import 'package:devotionalApp/widgets/navBar.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  final appTitle = 'Devoción Matutina';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(fontFamily: 'CantoraOne',),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title, 
          style: TextStyle(
            fontFamily: 'CantoraOne',
            fontSize: 23.0
            ),
            ),
        backgroundColor: Colors.green,
        toolbarHeight: MediaQuery.of(context).size.height / 10.0,
        ),
      body: Center(
        child: Text(
          'Text center',
          style: TextStyle(
            fontFamily: 'CantoraOne',
            fontSize: 60.0), 
            )
        ),
      //drawer: MenuLateral(),
      bottomNavigationBar: NavBar()
    );
  }
}