import 'package:flutter/material.dart';
import 'halaman/halaman_utama.dart';

void main() {
  runApp(AplikasiPerpustakaan());
}

class AplikasiPerpustakaan extends StatelessWidget {
  const AplikasiPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manajemen Perpustakaan',
      home: HalamanUtama(),
    );
  }
}
