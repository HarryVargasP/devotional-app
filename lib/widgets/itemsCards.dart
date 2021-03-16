import 'package:devotionalApp/models/devotional.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ItemsCard extends StatelessWidget {
  final Devotional devotional;
  final Function press;

  const ItemsCard({
    Key key,
    this.devotional,
    this.press,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              decoration: BoxDecoration(
                color: devotional.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${devotional.category}",
                child: Image.network(devotional.imageURL, width: 180.0,),
              ),
            ),
          ),
          Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  devotional.category,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
          ),
          Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text(
                  devotional.title,
                  style: TextStyle(color: kTextLightColor, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
          )          
        ],
      ),
    );
  }
}
  