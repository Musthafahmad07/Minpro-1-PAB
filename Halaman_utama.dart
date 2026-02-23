import 'package:flutter/material.dart';
import '../model/buku.dart';
import 'halaman_form.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  static ValueNotifier<List<Buku>> daftarBuku =
      ValueNotifier([]);

  void tambahBuku(Buku buku) {
    daftarBuku.value = [...daftarBuku.value, buku];
  }

  void hapusBuku(int index) {
    final list = [...daftarBuku.value];
    list.removeAt(index);
    daftarBuku.value = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Perpustakaan"),
      ),
      body: ValueListenableBuilder<List<Buku>>(
        valueListenable: daftarBuku,
        builder: (context, bukuList, _) {
          if (bukuList.isEmpty) {
            return const Center(
              child: Text("Belum ada data buku"),
            );
          }

          return ListView.builder(
            itemCount: bukuList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(bukuList[index].judul),
                  subtitle: Text(
                      "${bukuList[index].pengarang} - ${bukuList[index].tahun}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => hapusBuku(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HalamanForm(
                saatSimpan: tambahBuku,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
