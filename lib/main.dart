
import 'package:app4/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
   title: 'Flutter Demo',
      theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(
             brightness: Brightness.dark,
          seedColor: Color.fromARGB(255,132,0,51)
          ),
          textTheme: GoogleFonts.lateefTextTheme(),
          ),
      home: TabsScreen(),
      
    );
  }
}
