import 'package:devotionalApp/models/devotional.dart';
import 'package:flutter/material.dart';

class DevotionalPage extends StatelessWidget {
  final Devotional devotional;
  
  const DevotionalPage({Key key, this.devotional}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text(
          devotional.category + " " + devotional.date.substring(0,4),
          style: TextStyle(
            fontSize: 23.0,
            //color: kTextColor
            ),
            ),       
        backgroundColor: devotional.appBarColor,
        toolbarHeight: MediaQuery.of(context).size.height / 10.0,
        //leading: Icon(Icons.plagiarism_sharp),
      ),
      body: Container(
          child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: devotional.content == null ? 0 : devotional.content.length,
                  itemBuilder: (BuildContext context, int index) => 
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        devotional.content[index], 
                        style: TextStyle(
                          fontFamily: 'Montserrat-Light',
                          fontSize: 20.0
                          ),
                        ),
                    )
        ),
      ), 
      
      /*Padding(
            padding: const EdgeInsets.only(right:10.0, left: 10.0, top: 10.0),   
            child: Column(
              children: [ 
                Center(
                  child: Text(
                      devotional.title,
                      style: TextStyle(
                        fontSize: 23.0,         
                        ), 
                    ),
                ),  

                Align(
                  alignment: Alignment.centerRight,
                  child:
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                            devotional.date.substring(0,10), //Convert date
                            style: TextStyle(
                              fontSize: 16.0,         
                              ), 
                          ),
                    ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                        devotional.verse,
                        style: TextStyle(
                          fontSize: 14.0,       
                          fontFamily: 'Montserrat-Light',  
                          ), 
                      ),
                ),

                       
                Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 15.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: devotional.content == null ? 0 : devotional.content.length,
                    itemBuilder: (BuildContext context, int index) => 
                      Text(
                        devotional.content[index], 
                        style: TextStyle(
                          fontFamily: 'Montserrat-Light',
                          fontSize: 14.0
                          ),
                        )
                    ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child:
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                            devotional.bookName,
                            style: TextStyle(
                              fontSize: 16.0,         
                              ), 
                          ),
                    ),
                ),
              ],
      ),
        ),*/
    );
  }
}