import 'package:flutter/material.dart';

void main() => runApp(IglesiasPage());

class IglesiasPage extends StatefulWidget {
  @override
  _IglesiasPageState createState() => _IglesiasPageState();
}

class _IglesiasPageState extends State<IglesiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Buscar Iglesias"),
        backgroundColor: Colors.green,
        toolbarHeight: MediaQuery.of(context).size.height / 10.0,
      ),
      body: new Center(
        child: Text ("Hola"),
      ),
    );
  }
}