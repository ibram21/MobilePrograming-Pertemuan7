import 'package:flutter/material.dart';
// Import halaman pertemuan sesuai struktur folder di PPT
import 'package:pertemuan6/pertemuan/pertemuan5.dart';
import 'package:pertemuan6/pertemuan/pertemuan6.dart';
import 'package:pertemuan6/pertemuan/pertemuan7.dart';
import 'package:pertemuan6/pertemuan/pertemuan8.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Pertemuan 5",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": const Text(
        "Halaman Pertemuan 5",
      ), // Tambahkan const di sini jika classnya mendukung
    },
    {
      "title": "Pertemuan 6",
      "icon": Icons.auto_stories,
      "color": Colors.green,
      "page": CheckboxPage(), // Tambahkan const di sini jika classnya mendukung
    },
    {
      "title": "Pertemuan 7",
      "icon": Icons.auto_stories,
      "color": Colors.orange,
      "page": Pertemuan7Page(),
    },
    {
      "title": "Pertemuan 8",
      "icon": Icons.auto_stories,
      "color": Colors.purple,
      "page": AutocompletespinPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _buildMenuCard(
              context: context,
              title: item['title'],
              iconData: item['icon'],
              color: item['color'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required IconData iconData,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, size: 40, color: color),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
