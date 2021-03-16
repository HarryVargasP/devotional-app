import 'dart:async';
import 'dart:convert';

import 'package:devotionalApp/models/devotional.dart';
import 'package:devotionalApp/widgets/itemsCards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../constants.dart';
import 'devotional.dart';

void main() => runApp(new MaterialApp(
  home: new DevotionalMenu(),
));

class DevotionalMenu extends StatefulWidget {
  @override
  DevotionalMenuState createState () => new DevotionalMenuState();
}

class DevotionalMenuState extends State<DevotionalMenu> {

  //final String api_url = "localhost:3000/api/devotional/";
  final String api_url = "https://arcane-scrubland-99024.herokuapp.com/api/devotional/";
  List data;
  bool isLoading = true;
  /*static DateTime date = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  static final String formatted = formatter.format(date);*/
  
  @override
  void initState () {
    super.initState();
    this.getJsonData();
  }

  Future <String> getJsonData () async {
    var response = await http.get(
      Uri.encodeFull(api_url),
      headers: {"accept":"application/json"},      
    );

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['devotionals'];
      isLoading = false;
    }); 

    print(DateTime.now());
    print(new DateFormat.yMMMd().format(new DateTime.now()));//.parse("2021-02-05")));

    return "Success";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Devocionales",
          style: TextStyle(
            fontSize: 23.0
            ),
            ),       
        backgroundColor: Colors.green,
        toolbarHeight: MediaQuery.of(context).size.height / 10.0,
        //leading: Icon(Icons.plagiarism_sharp),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Hola",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPaddin, 
                right: kDefaultPaddin, 
                left: kDefaultPaddin,
              ),
              child: isLoading == true ?         
                Center(
                  child: Text(
                    'Cargando...',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 40.0),
                    textAlign: TextAlign.center,                   
                    ),
                ) : data == null || data.length == 0 ?
                Center(
                  child: Text(
                    'No hay devocionales disponibles',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 40.0),
                    textAlign: TextAlign.center,                   
                    ),
                ) ://ELSE
                GridView.builder(
                  itemCount: data == null ? 0 : data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (BuildContext context, int index) => ItemsCard(
                        devotional: Devotional.fromJson(data[index]),
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DevotionalPage(
                                devotional: Devotional.fromJson(data[index]),
                              ),
                            )),
                      )
                      ),
            ),
          ),
        ],
    ),
    );
  }
}

