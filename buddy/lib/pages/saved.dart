import 'package:flutter/material.dart';
import 'package:buddy/data/local_db_helper.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<Map<String, dynamic>> _items = [];

  void _loadItems() async {
    final items = await DatabaseHelper.getItems();
    setState(() {
      _items = items;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stored Torque Values'), actions: [
        IconButton(
            onPressed: () {
              DatabaseHelper.deleteAllItems();
            },
            icon: Icon(Icons.delete))
      ]),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]['name']),
          );
        },
      ),
    );
  }
}