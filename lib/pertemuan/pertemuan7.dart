import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 7 - Input Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan7Page(),
    );
  }
}

class Pertemuan7Page extends StatefulWidget {
  const Pertemuan7Page({super.key});

  @override
  State<Pertemuan7Page> createState() => _Pertemuan7PageState();
}

class _Pertemuan7PageState extends State<Pertemuan7Page> {
  // Controller untuk TextField
  final TextEditingController _namaController = TextEditingController();
  
  // State untuk RadioButton
  String? _jenisKelamin;
  
  // State untuk Checkbox
  bool _hobiMembaca = false;
  bool _hobiCoding = false;
  
  // State untuk Switch
  bool _isNotifOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets - Pertemuan 7'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TextField
            const Text("Nama Lengkap:", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                hintText: "Masukkan nama anda",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // 2. Radio Button (Jenis Kelamin)
            const Text("Jenis Kelamin:", style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              title: const Text("Laki-laki"),
              leading: Radio<String>(
                value: "Laki-laki",
                groupValue: _jenisKelamin,
                onChanged: (value) {
                  setState(() => _jenisKelamin = value);
                },
              ),
            ),
            ListTile(
              title: const Text("Perempuan"),
              leading: Radio<String>(
                value: "Perempuan",
                groupValue: _jenisKelamin,
                onChanged: (value) {
                  setState(() => _jenisKelamin = value);
                },
              ),
            ),
            const SizedBox(height: 20),

            // 3. Checkbox (Hobi)
            const Text("Hobi:", style: TextStyle(fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: const Text("Membaca Buku"),
              value: _hobiMembaca,
              onChanged: (value) {
                setState(() => _hobiMembaca = value!);
              },
            ),
            CheckboxListTile(
              title: const Text("Coding"),
              value: _hobiCoding,
              onChanged: (value) {
                setState(() => _hobiCoding = value!);
              },
            ),
            const SizedBox(height: 20),

            // 4. Switch (Notification)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Aktifkan Notifikasi:", style: TextStyle(fontWeight: FontWeight.bold)),
                Switch(
                  value: _isNotifOn,
                  onChanged: (value) {
                    setState(() => _isNotifOn = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Tombol Simpan/Tampilkan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Data Terinput"),
                      content: Text(
                        "Nama: ${_namaController.text}\n"
                        "Gender: ${_jenisKelamin ?? '-'}\n"
                        "Hobi: ${_hobiMembaca ? 'Membaca ' : ''}${_hobiCoding ? 'Coding' : ''}\n"
                        "Notif: ${_isNotifOn ? 'Aktif' : 'Nonaktif'}"
                      ),
                    ),
                  );
                },
                child: const Text("Tampilkan Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}