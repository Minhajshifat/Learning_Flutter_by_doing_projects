import 'package:expance_tracker/screens/widgets/expances.dart';
import 'package:flutter/material.dart';
 

var selected_color=ColorScheme.fromSeed(seedColor:Colors.deepPurpleAccent);
 
 var dselected_color=ColorScheme.fromSeed(
  
  brightness: Brightness.dark,
  seedColor: Color.fromRGBO(16, 31, 65, 0.741));
 
 
 
 
 void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
     darkTheme: ThemeData.dark().copyWith(
      colorScheme: dselected_color,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor:dselected_color.primaryContainer,
        foregroundColor: dselected_color.onPrimaryContainer,
      ),
       scaffoldBackgroundColor: dselected_color.surface,
      cardTheme: CardThemeData().copyWith(
        color: dselected_color.surfaceContainer,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      ),
         textTheme: TextTheme().copyWith(
         titleLarge: TextStyle(
          fontSize: 20,
          fontWeight:FontWeight.bold,
          color: dselected_color.onSurface,
         ),
         bodyMedium: TextStyle(
          color: dselected_color.inverseSurface,
         )
      ),
      iconTheme: IconThemeData().copyWith(
        color: const Color.fromARGB(255, 121, 163, 255),
      ),
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: dselected_color.secondaryContainer,
      )

     ),
     textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: dselected_color.secondaryContainer,
      )
     )
     ),



    theme: ThemeData(
      useMaterial3: true,
      colorScheme: selected_color,
      
      
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor:selected_color.primary,
        foregroundColor: selected_color.onPrimary,
      ),
      scaffoldBackgroundColor: selected_color.surface,
      cardTheme: CardThemeData().copyWith(
        color: selected_color.primaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      ),
      textTheme: TextTheme().copyWith(
         titleLarge: TextStyle(
          fontSize: 20,
          fontWeight:FontWeight.bold,
          color: selected_color.surfaceContainerHighest,
         ),
         bodyMedium: TextStyle(
          color: selected_color.onPrimaryFixedVariant,
         )
      ),
      iconTheme: IconThemeData().copyWith(
        color: const Color.fromARGB(255, 121, 163, 255),
      ),
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: selected_color.secondaryContainer,
      )

     ),
     textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: selected_color.secondaryContainer,
      )
     )
    ),
    //themeMode: ThemeMode.dark,
    home: Expances(),
  ));
 }