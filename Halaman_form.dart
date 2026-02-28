import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/buku.dart';

class HalamanForm extends StatelessWidget {
  final Function(Buku) saatSimpan;
  final Buku? buku;

  // Constructor untuk menerima data buku dan fungsi saatSimpan
  const HalamanForm({super.key, required this.saatSimpan, this.buku});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller dengan data buku (jika ada) atau nilai kosong
    TextEditingController controllerJudul =
        TextEditingController(text: buku?.judul ?? '');
    TextEditingController controllerPengarang =
        TextEditingController(text: buku?.pengarang ?? '');
    TextEditingController controllerTahun =
        TextEditingController(text: buku?.tahun ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(buku == null ? "Tambah Buku" : "Edit Buku"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: controllerJudul,
                decoration: const InputDecoration(labelText: "Judul Buku"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              TextFormField(
                controller: controllerPengarang,
                decoration: const InputDecoration(labelText: "Nama Pengarang"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              TextFormField(
                controller: controllerTahun,
                decoration: const InputDecoration(labelText: "Tahun"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (controllerJudul.text.isNotEmpty &&
                      controllerPengarang.text.isNotEmpty &&
                      controllerTahun.text.isNotEmpty) {
                    saatSimpan(
                      Buku(
                        judul: controllerJudul.text,
                        pengarang: controllerPengarang.text,
                        tahun: controllerTahun.text,
                      ),
                    );
                    Get.back(); // Kembali ke halaman sebelumnya
                  } else {
                    // Validasi manual jika perlu
                    Get.snackbar("Peringatan", "Semua kolom harus diisi!");
                  }
                },
                child: Text(buku == null ? "Simpan" : "Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
