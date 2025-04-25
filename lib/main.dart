import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:math' as math;
import 'gang/samuel.dart'; 
import 'gang/adam.dart';
import 'gang/agung.dart';
import 'gang/farhan.dart';
import 'gang/kesanpesan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lbbgysiobeziklmuwydq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxiYmd5c2lvYmV6aWtsbXV3eWRxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1ODg0NzEsImV4cCI6MjA2MTE2NDQ3MX0.SxyZoiAhccyN0O9TEO7Y2S42IU7lfDs-gcbKM8QCB8w',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const FriendsListScreen(),
    );
  }
}

class FriendsListScreen extends StatefulWidget {
  const FriendsListScreen({Key? key}) : super(key: key);

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Esia Friend"),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
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
              const SizedBox(height: 60),
              buildCustomContainer(
                context,
                "Kesan & Pesan",
                Colors.blueAccent, 
                0, 
                4,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FeedbackPage())),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
        isHome: true,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.group,
                      size: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Esia Friend',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Navigate to profiles',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.orange),
              title: const Text('Adam'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AdamPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: const Text('Samuel'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SamuelPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.red),
              title: const Text('Agung'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AgungPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text('Farhan'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FarhanPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback, color: Colors.blueAccent),
              title: const Text('Kesan & Pesan'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FeedbackPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                // Show about dialog
                showAboutDialog(
                  context: context,
                  applicationName: 'Esia Friend',
                  applicationVersion: '1.0.0',
                  applicationIcon: const FlutterLogo(size: 30),
                  children: [
                    const Text('A simple app to navigate between profiles of Esia friends.'),
                  ],
                );
              },
            ),
          ],
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

// Custom Navigation Bar Widget (to be used in all pages)
class CustomNavBar extends StatelessWidget {
  final VoidCallback? onBackTap;
  final VoidCallback onMenuTap;
  final bool isHome;
  final Color accentColor;

  const CustomNavBar({
    Key? key,
    this.onBackTap,
    required this.onMenuTap,
    this.isHome = false,
    this.accentColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Back Button
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isHome ? Colors.grey.shade400 : Colors.black87,
              size: 28,
            ),
            onPressed: isHome ? null : onBackTap ?? () => Navigator.pop(context),
          ),
          
          // Home Button (Center Circle)
          GestureDetector(
            onTap: isHome ? null : () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const FriendsListScreen()),
                (route) => false, // Remove all previous routes
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isHome ? accentColor : Colors.white,
                border: Border.all(
                  color: accentColor,
                  width: 3,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.home,
                color: isHome ? Colors.white : accentColor,
                size: 30,
              ),
            ),
          ),
          
          // Menu Button (3 lines)
          // IconButton(
          //   icon: const Icon(
          //     Icons.menu,
          //     color: Colors.black87,
          //     size: 28,
          //   ),
          //   onPressed: onMenuTap,
          // ),
        ],
      ),
    );
  }
}