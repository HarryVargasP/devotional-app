import 'package:flutter/material.dart';

class Devotional {
  final String title, category, bookName, author, verse, date, imageURL, audioURL;
  final Color appBarColor, cardColor;
  final List content;
  
  Devotional(
    this.title,
    this.category,
    this.bookName,
    this.author,
    this.verse,
    this.content,
    this.date,
    this.imageURL,
    this.audioURL,
    this.appBarColor,
    this.cardColor
  );

  factory Devotional.fromJson(dynamic json) {
    Color appBarColor = Colors.lime;
    Color cardColor = Colors.lime.shade100;
    if (json['category'] as String == 'Jóvenes') {
      appBarColor = Colors.lightBlue;
      cardColor = Colors.lightBlue.shade100;
    } else if (json['category'] as String == 'Adultos') {      
      appBarColor = Colors.brown;
      cardColor = Colors.brown.shade100;
    } else if (json['category'] as String == 'Damas') {
      appBarColor = Colors.pink;
      cardColor = Colors.pink.shade50;
    } else if (json['category'] as String == 'Menores') {
      appBarColor = Colors.deepOrange;
      cardColor = Colors.deepOrange.shade100;
    } else if (json['category'] as String == 'Pequeños') {
      appBarColor = Colors.lightGreen;
      cardColor = Colors.lightGreen.shade100;
    } else if (json['category'] as String == 'Adolescentes') {
      appBarColor = Colors.teal;
      cardColor = Colors.teal.shade100;
    }
    return Devotional(json['title'] as String, 
                      json['category'] as String,
                      json['bookName'] as String,
                      json['author'] as String,
                      json['verse'] as String,
                      json['content'] as List,
                      json['date'] as String,
                      json['imageURL'] as String,
                      json['audioURL'] as String,
                      appBarColor,
                      cardColor);
  }
}