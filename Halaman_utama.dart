import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/buku.dart';
import 'halaman_form.dart';
import 'halaman_tentang.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<Buku> daftarBuku = [];

  void tambahBuku(Buku buku) {
    setState(() {
      daftarBuku.add(buku);
    });
  }

  void updateBuku(int index, Buku bukuBaru) {
    setState(() {
      daftarBuku[index] = bukuBaru;
    });
  }

  void hapusBuku(int index) {
    setState(() {
      daftarBuku.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manajemen Perpustakaan")),

      body: ListView.builder(
        itemCount: daftarBuku.length,
        itemBuilder: (context, index) {
          final buku = daftarBuku[index];
          return ListTile(
            title: Text(buku.judul),
            subtitle: Text("${buku.pengarang} - ${buku.tahun}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Get.to(
                      () => HalamanForm(
                        buku: buku,
                        saatSimpan: (bukuBaru) {
                          updateBuku(index, bukuBaru);
                        },
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    hapusBuku(index);
                  },
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => HalamanForm(
              saatSimpan: (bukuBaru) {
                tambahBuku(bukuBaru);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Center(
            child: TextButton(
              onPressed: () {
                Get.to(HalamanTentang());
              },
              child: Text(
                "Tentang",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
