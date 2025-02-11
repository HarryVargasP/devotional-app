import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new X(),
));

class X extends StatefulWidget {
  @override
  DevotionalMenuState createState () => new DevotionalMenuState();
}

class DevotionalMenuState extends State<X> {

  final String api_url = "https://arcane-scrubland-99024.herokuapp.com/api/devotional/";
  List data;

  @override
  void initState () {
    super.initState();
    this.getJsonData();
  }

  Future <String> getJsonData () async {
    var response = await http.get(
      Uri.encodeFull(api_url),
      headers: {"accept":"application/json"}
    );

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['devotionals'];
    }); 

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Devocionales",
          style: TextStyle(
            fontFamily: 'CantoraOne',
            fontSize: 23.0
            ),
            ),       
        backgroundColor: Colors.green,
        toolbarHeight: MediaQuery.of(context).size.height / 10.0,
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(data[index]['title']),
                      padding: const EdgeInsets.all(20), 
                    ),
                    )
                ],
              )
            ,)
          );
        },
      ),
    );
  }
}