import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'halaman/halaman_utama.dart';

void main() {
  runApp(const AplikasiPerpustakaan());
}

class AplikasiPerpustakaan extends StatelessWidget {
  const AplikasiPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manajemen Perpustakaan',
      home: const HalamanUtama(),
    );
  }
}
