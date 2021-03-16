import 'package:devotionalApp/main.dart';
import 'package:devotionalApp/screens/devotionalMenu.dart';
import 'package:devotionalApp/screens/iglesias.dart';
import 'package:flutter/material.dart';


class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  List<Widget> _widgets = [MyApp(), DevotionalMenu(), IglesiasPage(), IglesiasPage()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => _widgets.elementAt(index)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined
          ), 
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book_outlined
          ), 
          label: 'Devocionales'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.place_outlined
            ), 
          label: 'Iglesias'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_balance_outlined
          ), 
          label: 'Test'
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
    );
  }
}