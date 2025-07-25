import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFF0d141c),
    );

    final InputDecoration inputDecoration = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFe7edf4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      hintStyle: const TextStyle(color: Color(0xFF49739c)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Color(0xFF0d141c)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          'Hotels',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF0d141c),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 12),
          TextField(
            decoration: inputDecoration.copyWith(
              hintText: 'Where to?',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF49739c)),
              prefixIconConstraints: const BoxConstraints(minWidth: 48),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Check-in', style: labelStyle),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: inputDecoration.copyWith(
                        hintText: '12/12/2024',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Check-out', style: labelStyle),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: inputDecoration.copyWith(
                        hintText: '12/15/2024',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Guests', style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                decoration: inputDecoration.copyWith(hintText: '1 guest'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0c7ff2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Popular Destinations',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0d141c),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            children: const [
              DestinationCard(
                city: 'Paris',
                imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
              ),
              DestinationCard(
                city: 'London',
                imageUrl: 'https://images.unsplash.com/photo-1473959383410-df7c3d0c3a48',
              ),
              DestinationCard(
                city: 'New York',
                imageUrl: 'https://images.unsplash.com/photo-1549924231-f129b911e442',
              ),
              DestinationCard(
                city: 'Rome',
                imageUrl: 'https://images.unsplash.com/photo-1533682189936-7201d5fca4f0',
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String city;
  final String imageUrl;

  const DestinationCard({
    super.key,
    required this.city,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          city,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0d141c),
          ),
        ),
      ],
    );
  }
}
