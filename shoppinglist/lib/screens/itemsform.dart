import 'package:flutter/material.dart';
import 'package:shoppinglist/data/categories.dart';

class Additem extends StatefulWidget {
  const Additem({super.key});

  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  final _formkey = GlobalKey<FormState>();

  void saveitem() {
    _formkey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add new item")),
      body: Container(
        padding: EdgeInsets.all(19),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(label: Text("Enter your Name")),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return "Invalid name";
                  }
                  return null;
                },
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Enter Quantity"),
                      ),
                      initialValue: "1",
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null) {
                          return "Invalid quantity";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        for (final cat in categories.entries)
                          DropdownMenuItem(
                            value: cat.value,
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: cat.value.color,
                                ),
                                SizedBox(width: 8),
                                Text(cat.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formkey.currentState!.reset();
                    },
                    child: Text("Reset"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(onPressed: saveitem, child: Text("Save")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
