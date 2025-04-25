import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<String?> getBioById(int id) async {
    final data = await supabase
        .from('biodata')
        .select('bio')
        .eq('id', id)
        .maybeSingle();

    return data?['bio'];
  }

  Future<void> insertPesan({
    required String nama,
    required String alamat,
    required String kesan,
    required String pesan,
  }) async {
    await supabase.from('pesan').insert({
  'nama': nama,
  'alamat': alamat,
  'kesan': kesan,
  'pesan': pesan,
});



  
}}
