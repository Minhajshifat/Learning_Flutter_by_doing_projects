import 'package:flutter/material.dart';
import 'package:shoppinglist/data/dummy_items.dart';
import 'package:shoppinglist/screens/itemsform.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = groceryItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Grosaries"),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => const Additem()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            //isThreeLine: true,
            leading: Container(
              height: 25,
              width: 25,
              color: items[index].category.color,
            ),
            title: Text(items[index].name),
            titleAlignment: ListTileTitleAlignment.center,
            //subtitle: Text(""),
            trailing: Text(
              items[index].quantity.toString(),
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
