import 'package:flutter/material.dart';

class HairstyleScreen extends StatelessWidget {
  const HairstyleScreen({super.key});

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
          'Book Hairstyle',
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
          StylistCard(
            name: 'Anjali Beauty Studio',
            service: 'Bridal Hair & Makeup',
            rating: '4.8',
            price: '₹899',
            imageUrl: 'https://images.unsplash.com/photo-1599940824395-32288b23481c',
          ),
          StylistCard(
            name: 'Style Spa Salon',
            service: 'Haircut & Styling',
            rating: '4.5',
            price: '₹499',
            imageUrl: 'https://images.unsplash.com/photo-1549921296-3a6b1d6204c4',
          ),
          StylistCard(
            name: 'Glow & Glam',
            service: 'Hair Smoothening',
            rating: '4.7',
            price: '₹1199',
            imageUrl: 'https://images.unsplash.com/photo-1559599238-d7b1f968bd15',
          ),
        ],
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  final String name;
  final String service;
  final String rating;
  final String price;
  final String imageUrl;

  const StylistCard({
    super.key,
    required this.name,
    required this.service,
    required this.rating,
    required this.price,
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
              service,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF49739c),
              ),
            ),
            Text(
              '⭐ $rating  •  $price',
              style: const TextStyle(
                fontSize: 13,
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
            // Navigate to booking form
          },
          child: const Text('Book'),
        ),
      ),
    );
  }
}
