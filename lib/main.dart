import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Esia Friend",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCustomContainer(
                  "Nur Adam Mahfudh",
                  Colors.orange,
                  -0.07,
                  0,
                ),
                buildCustomContainer(
                  "Samuel Nardus H. Sinaga",
                  Colors.green,
                  0.07,
                  1,
                ),
                buildCustomContainer("Agung Sedayu", Colors.red, -0.07, 2),
                buildCustomContainer("Farhan Ramadhan", Colors.teal, 0.07, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomContainer(
    String text,
    Color color,
    double angle,
    int shapeType,
  ) {
    ShapeBorder shape;
    switch (shapeType) {
      case 0:
        shape = const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        );
        break;
      case 1:
        shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
        break;
      case 2:
        shape = const StadiumBorder();
        break;
      case 3:
        shape = const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(50),
          ),
        );
        break;
      default:
        shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
    }

    return Transform.rotate(
      angle: angle * math.pi,
      child: Container(
        height: 85,
        width: 330,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: ShapeDecoration(
          color: color,
          shape: shape,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}