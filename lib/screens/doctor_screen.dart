import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0d141c)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Consult a Doctor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF0d141c),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 12),
          DoctorCard(
            name: 'Dr. Meera Kapoor',
            specialty: 'General Physician',
            experience: '10 yrs experience',
            imageUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
          ),
          DoctorCard(
            name: 'Dr. Arjun Singh',
            specialty: 'Cardiologist',
            experience: '15 yrs experience',
            imageUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
          ),
          DoctorCard(
            name: 'Dr. Priya Sharma',
            specialty: 'Dermatologist',
            experience: '8 yrs experience',
            imageUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String experience;
  final String imageUrl;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0d141c),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              specialty,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF49739c),
              ),
            ),
            Text(
              experience,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF999999),
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0d141c),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Navigate to booking
          },
          child: const Text('Book'),
        ),
      ),
    );
  }
}
