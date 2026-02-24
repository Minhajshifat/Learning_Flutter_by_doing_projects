import 'package:flutter/material.dart';

var urls = [
  "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg",
  "https://images.pexels.com/photos/1624229/pexels-photo-1624229.jpeg",
  "https://images.pexels.com/photos/2182970/pexels-photo-2182970.jpeg",
  "https://images.pexels.com/photos/573299/pexels-photo-573299.jpeg",
];

class Examplestateful extends StatefulWidget {
  const Examplestateful({super.key});

  @override
  State<Examplestateful> createState() => _ExamplestatefulState();
}

class _ExamplestatefulState extends State<Examplestateful> {
  var index = 0;
  Row makechanges() {
    return Row(
      children: [
        IconButton(onPressed: () {
          setState(() {
            index=index==0?0:index-1;
          });
        }, icon: Icon(Icons.arrow_back),iconSize: 30,),
        Spacer(),
        IconButton(onPressed: () {
          setState(() {
            index=index==urls.length-1?index:index+1;
          });
        }, icon: Icon(Icons.arrow_forward),iconSize: 30,),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            urls[index],
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            right: 5,
            left: 5,
            top: 180,
            child: makechanges()
            ),
        ],
      ),
    );
  }
}
