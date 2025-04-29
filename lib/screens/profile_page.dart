import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            // Name
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Nama: Ade Kurnia'),
              ),
            ),
            const SizedBox(height: 10),
            // Email
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email: adekurnia@example.com'),
              ),
            ),
            const SizedBox(height: 10),
            // About Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Tentang: Aplikasi Booking Hotel UTS Flutter'),
              ),
            ),
            const SizedBox(height: 20),
            // Button to Edit Profile
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Edit profile logic here
                },
                child: const Text('Edit Profil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
