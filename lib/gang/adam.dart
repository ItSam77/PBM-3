import 'package:flutter/material.dart';
import '../main.dart';
import '../supabase_service.dart';

class AdamPage extends StatefulWidget {
  const AdamPage({Key? key}) : super(key: key);

  @override
  State<AdamPage> createState() => _AdamPageState();
}

class _AdamPageState extends State<AdamPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SupabaseService supabaseService = SupabaseService();

  String? bio;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBio();
  }

  void fetchBio() async {
    final result = await supabaseService.getBioById(1); // ID Adam = 1
    setState(() {
      bio = result;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Adam Profile'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove default back button
      ),
      drawer: _buildDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.amber],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                // child: Icon(Icons.person, size: 100, color: Colors.orange),
                backgroundImage: AssetImage('images/adam.webp'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nur Adam Mahfudh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About Adam:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                bio ?? 'Tidak ada data.',
                                style: const TextStyle(fontSize: 16),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
        accentColor: Colors.orange,
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
                  colors: [Colors.orange, Colors.amber],
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
                    child: Icon(Icons.person, size: 30, color: Colors.orange),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Adam\'s Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const FriendsListScreen()),
                  (route) => false,
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
                    const Text(
                      'A simple app to navigate between profiles of Esia friends.',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
