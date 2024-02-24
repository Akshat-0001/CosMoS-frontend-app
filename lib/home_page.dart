import 'package:flutter/material.dart';
import 'background_with_stars.dart'; // Import the BackgroundWithStars widget
import 'home_screen.dart'; // Import the home_screen.dart file

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1; // Default index for 'Home'

  List<Widget> _widgetOptions = <Widget>[
    BackgroundWithStars(
      child: Center(child: Text('Coming Soon!')),
    ),
    BackgroundWithStars(
      child: HomeScreen(), // Wrap HomeScreen with BackgroundWithStars
    ),
    BackgroundWithStars(
      child: Center(child: Text('About')),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width:50),
            Text('CosMoS'),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Coming Soon!',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
