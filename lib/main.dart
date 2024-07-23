import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _currentColor,
        body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Press the invisible button and the color will change!', style: GoogleFonts.salsa(
              color: const Color.fromARGB(255, 31, 245, 3),fontSize: 15,fontWeight:FontWeight.bold)),
              const SizedBox(height: 50,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentColor = _colorsTap()._color();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(_currentColor),
                  ),
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _colorsTap {
  final Random _random = Random();
  Color _color() {
    return Color.fromARGB(
      255, _random.nextInt(255), _random.nextInt(255), _random.nextInt(255));
  }
}