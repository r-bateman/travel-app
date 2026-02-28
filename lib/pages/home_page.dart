import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/add_memory_page.dart';
import 'package:travel_app/pages/map_page.dart';
import 'package:travel_app/pages/memories_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // navigate bottom bar
  int _selectedIndex = 1;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // define pages
  final List<Widget> _pages = [
    MapPage(),
    MemoriesPage()
  ];

  // navigate to AddMemoryPage
  void _onAddMemoryPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMemoryPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = _selectedIndex == 1;
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Sign out'),
          )
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      floatingActionButton: showFab ? FloatingActionButton(
        onPressed: _onAddMemoryPressed,
        child: const Icon(Icons.add),
      ): null,
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