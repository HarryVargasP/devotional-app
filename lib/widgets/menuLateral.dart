import 'package:devotionalApp/screens/devotionalMenu.dart';
import 'package:devotionalApp/screens/iglesias.dart';
import 'package:flutter/material.dart';

import '../x.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,                
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 150.0,
                    
                    ) 
                  ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0)              
          ),
          ListTile(
            leading: Icon(
              Icons.book_outlined,
              color: Colors.brown.shade700,
              ),
            title: Text(
              'Devocionales',
              style: TextStyle(
                fontSize: 18.0),
                ),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => DevotionalMenu()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.place_outlined, 
              color: Colors.red.shade900,
              ),
            title: Text(
              'Buscar Iglesias',
              style: TextStyle(
                fontSize: 18.0),
                ),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => IglesiasPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.ac_unit, 
              color: Colors.blue.shade900,
              ),
            title: Text(
              'x',
              style: TextStyle(
                fontSize: 18.0),
                ),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => X()),
              );
            },
          ),
        ],
      ),
    );
  }
}