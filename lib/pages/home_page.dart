import 'package:flutter/material.dart';
import 'package:travel_app/pages/map_page.dart';
import 'package:travel_app/pages/memories_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // define pages
  final List<Widget> _pages = [
    MapPage(),
    MemoriesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
              label: 'Map'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo),
                label: 'Memories'
            ),
          ],
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
      ),
    );
  }
}