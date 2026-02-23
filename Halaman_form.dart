import 'package:flutter/material.dart';
import '../model/buku.dart';

class HalamanForm extends StatelessWidget {
  final Function(Buku) saatSimpan;

  HalamanForm({super.key, required this.saatSimpan});

  final TextEditingController controllerJudul =
      TextEditingController();
  final TextEditingController controllerPengarang =
      TextEditingController();
  final TextEditingController controllerTahun =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Buku"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controllerJudul,
                decoration:
                    const InputDecoration(labelText: "Judul Buku"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              TextFormField(
                controller: controllerPengarang,
                decoration: const InputDecoration(
                    labelText: "Nama Pengarang"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              TextFormField(
                controller: controllerTahun,
                decoration:
                    const InputDecoration(labelText: "Tahun"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saatSimpan(
                      Buku(
                        judul: controllerJudul.text,
                        pengarang: controllerPengarang.text,
                        tahun: controllerTahun.text,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
