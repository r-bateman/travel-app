import 'package:flutter/material.dart';

class AddMemoryPage extends StatefulWidget {
  const AddMemoryPage({super.key});

  @override
  State<AddMemoryPage> createState() => _AddMemoryPageState();
}

class _AddMemoryPageState extends State<AddMemoryPage> {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add Memory Page'),
      ),
      appBar: AppBar(
        title: Text("Add Memory Page"),
      ),
    );
  }
}