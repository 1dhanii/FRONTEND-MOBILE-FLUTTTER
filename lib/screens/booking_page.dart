// Styling upgrade for booking_page.dart
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool includeBreakfast = false;
  String selectedPayment = 'Transfer Bank';
  bool smokeFree = true;
  String selectedRoom = '1';
  List<String> selectedFacilities = [];

  final List<Facility> facilities = [
    Facility('WiFi', Icons.wifi),
    Facility('TV', Icons.tv),
    Facility('AC', Icons.ac_unit),
    Facility('Bathtub', Icons.bathtub),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Pemesanan Kamar'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Pilih Jumlah Kamar
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.meeting_room, color: Colors.indigo),
                title: const Text('Jumlah Kamar'),
                trailing: DropdownButton<String>(
                  value: selectedRoom,
                  underline: const SizedBox(),
                  items: ['1', '2', '3', '4']
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => selectedRoom = val!),
                ),
              ),
            ),
            // Fasilitas Tambahan
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.build, color: Colors.indigo),
                        SizedBox(width: 8),
                        Text('Fasilitas Tambahan', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: facilities.map((f) {
                        final isSelected = selectedFacilities.contains(f.name);
                        return FilterChip(
                          label: Text(f.name),
                          avatar: Icon(
                            f.icon,
                            size: 18,
                            color: isSelected ? Colors.white : Colors.indigo,
                          ),
                          selected: isSelected,
                          selectedColor: Colors.indigo,
                          onSelected: (sel) {
                            setState(() {
                              if (sel) {
                                selectedFacilities.add(f.name);
                              } else {
                                selectedFacilities.remove(f.name);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Bebas Rokok & Sarapan
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Bebas Rokok'),
                      secondary: const Icon(Icons.smoke_free, color: Colors.indigo),
                      value: smokeFree,
                      onChanged: (val) => setState(() => smokeFree = val),
                    ),
                    CheckboxListTile(
                      title: const Text('Termasuk Sarapan'),
                      secondary: const Icon(Icons.breakfast_dining, color: Colors.indigo),
                      value: includeBreakfast,
                      onChanged: (val) => setState(() => includeBreakfast = val!),
                    ),
                  ],
                ),
              ),
            ),
            // Metode Pembayaran
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Transfer Bank'),
                    secondary: const Icon(Icons.account_balance, color: Colors.indigo),
                    value: 'Transfer Bank',
                    groupValue: selectedPayment,
                    onChanged: (val) => setState(() => selectedPayment = val!),
                  ),
                  RadioListTile<String>(
                    title: const Text('Kartu Kredit'),
                    secondary: const Icon(Icons.credit_card, color: Colors.indigo),
                    value: 'Kartu Kredit',
                    groupValue: selectedPayment,
                    onChanged: (val) => setState(() => selectedPayment = val!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Pemesanan Berhasil'),
                      content: Text(
                          'Kamar: $selectedRoom\nFasilitas: ${selectedFacilities.join(', ')}\nSarapan: ${includeBreakfast ? "Ya" : "Tidak"}\nPembayaran: $selectedPayment'),
                    ),
                  );
                },
                child: const Text('Pesan Sekarang',
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Facility {
  final String name;
  final IconData icon;
  Facility(this.name, this.icon);
}
