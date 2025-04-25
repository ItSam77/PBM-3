import 'package:flutter/material.dart';
import '../main.dart';
import '../supabase_service.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final userController = TextEditingController();
  final alamatController = TextEditingController();
  final kesanController = TextEditingController();
  final pesanController = TextEditingController();

  String user = "Belum ada user.";
  String alamat = "Belum ada alamat.";
  String kesan = "Belum ada kesan.";
  String pesan = "Belum ada pesan.";

  void _submit() async {
    setState(() {
      user = userController.text;
      alamat = alamatController.text;
      kesan = kesanController.text;
      pesan = pesanController.text;
    });

    try {
      await SupabaseService().insertPesan(
        nama: user,
        alamat: alamat,
        kesan: kesan,
        pesan: pesan,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil dikirim ke Supabase")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal kirim ke Supabase: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kesan dan Pesan'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomTextField("Nama User", userController),
              const SizedBox(height: 16),
              _buildCustomTextField("Alamat", alamatController),
              const SizedBox(height: 16),
              _buildCustomTextField("Kesan", kesanController),
              const SizedBox(height: 16),
              _buildCustomTextField("Pesan", pesanController),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildResultCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        onMenuTap: () {
          // Add your desired functionality here
        },
        isHome: false,
        accentColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildCustomTextField(String label, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.blueGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Colors.blueAccent, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hasil Input:",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          const Divider(),
          _buildResultItem("👤 User", user),
          _buildResultItem("📍 Alamat", alamat),
          _buildResultItem("💖 Kesan", kesan),
          _buildResultItem("💬 Pesan", pesan),
        ],
      ),
    );
  }

  Widget _buildResultItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
                fontSize: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}