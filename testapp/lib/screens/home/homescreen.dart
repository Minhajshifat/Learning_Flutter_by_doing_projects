import 'package:flutter/material.dart';

var urlperson =
    "https://images.pexels.com/photos/1933873/pexels-photo-1933873.jpeg";
var urlcover =
    "https://images.pexels.com/photos/4526393/pexels-photo-4526393.jpeg";
var person1="https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg";
var person2="https://images.pexels.com/photos/1624229/pexels-photo-1624229.jpeg";
var person3="https://images.pexels.com/photos/5082976/pexels-photo-5082976.jpeg";
var person4="https://images.pexels.com/photos/31607534/pexels-photo-31607534.jpeg";
var person5="https://images.pexels.com/photos/573299/pexels-photo-573299.jpeg";
var person6="https://images.pexels.com/photos/2182970/pexels-photo-2182970.jpeg";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                urlcover,
                height: 300,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Container(
                height: double.minPositive,
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
            ],
          ),
          Positioned(
            left: 25,
            right: 24,
            bottom: 80,
            top: 120,
            child: Container(decoration: BoxDecoration(color: Colors.white)),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 40,
            bottom: 100,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150.0),
                  child: Image.network(
                    urlperson,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "The Smoker",
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Daily 3 packet of ciggarates",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w100,
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  
                  child: Row(
                    
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.snapchat,color: Colors.blueAccent,size: 30,),
                      Icon(Icons.mouse,size: 30,),
                      Icon(Icons.facebook,size: 30,),
                      Icon(Icons.car_crash,size: 30,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    spacing: 50,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("240",style: TextStyle(fontSize:40,fontWeight: FontWeight.bold),),
                      Text("FOLLOWING",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.grey),),
                        ],
                  
                      ),
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("24K",style: TextStyle(fontSize:40,fontWeight: FontWeight.bold),),
                      Text("FOLLOWING",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.grey),),
                        ],
                  
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    spacing: 0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.network(person1,height: 50,width: 50,
                          fit:BoxFit.fill,
                          ),
                          ),
                            ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.network(person2,height: 50,width: 50,
                          fit:BoxFit.fill,
                          ),
                          ),
                            ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.network(person3,height: 50,width: 50,
                          fit:BoxFit.fill,
                          ),
                          ),
                            ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.network(person4,height: 50,width: 50,
                          fit:BoxFit.fill,
                          ),
                          ),
                            ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.network(person5,height: 50,width: 50,
                          fit:BoxFit.fill,
                          ),
                          ),
                            ClipRRect(
                          borderRadius:BorderRadius.circular(50),
                          child: Image.network(person6,height: 50,width: 50,
                          fit:BoxFit.fill,
                          ),
                          ),
                        
                    ],
                  ),
                  
                ),
                Text("22 follower may you know",style: TextStyle(fontSize: 15,color: Colors.grey),),
                SizedBox(height: 50,),
               ElevatedButton(onPressed: (){}, child:Text("FOllow Now"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
