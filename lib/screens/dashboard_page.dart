import 'package:flutter/material.dart';
import 'booking_page.dart';
import 'profile_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Pilih Kamar Hotel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          HotelCard(
            title: 'Single bed',
            price: 'Rp 500.000 / malam',
            image: 'assets/kamar1.jpg',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BookingPage()));
            },
          ),
          HotelCard(
            title: 'Double bed',
            price: 'Rp 750.000 / malam',
            image: 'assets/kamar2.jpg',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BookingPage()));
            },
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final VoidCallback onTap;

  const HotelCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(image, height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(price, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
