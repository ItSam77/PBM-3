import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'gang/samuel.dart'; 
import 'gang/adam.dart';
import 'gang/agung.dart';
import 'gang/farhan.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FriendsListScreen(),
    );
  }
}

class FriendsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                context,
                "Nur Adam Mahfudh",
                Colors.orange,
                -0.07,
                0,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdamPage())),
              ),
              buildCustomContainer(
                context,
                "Samuel Nardus H. Sinaga",
                Colors.green,
                0.07,
                1,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SamuelPage())),
              ),
              buildCustomContainer(
                context,
                "Agung Sedayu",
                Colors.red, 
                -0.07, 
                2,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AgungPage())),
              ),
              buildCustomContainer(
                context,
                "Farhan Ramadhan",
                Colors.teal, 
                0.07, 
                3,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FarhanPage())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomContainer(
    BuildContext context,
    String text,
    Color color,
    double angle,
    int shapeType,
    VoidCallback onTap,
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
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}