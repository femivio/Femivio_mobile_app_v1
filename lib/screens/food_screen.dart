import 'package:flutter/material.dart';
import 'home_screen.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Food',
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
              hintText: 'Search food or restaurants',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF49739c)),
              prefixIconConstraints: const BoxConstraints(minWidth: 48),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Popular Restaurants',
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
            childAspectRatio: 0.9,
            children: const [
              FoodCard(
                title: 'Pizza Hut',
                imageUrl: 'https://images.unsplash.com/photo-1601924582975-b4972f6c1c9e',
              ),
              FoodCard(
                title: 'Burger King',
                imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
              ),
              FoodCard(
                title: 'KFC',
                imageUrl: 'https://images.unsplash.com/photo-1606755962773-0c02f63d0e4b',
              ),
              FoodCard(
                title: 'Subway',
                imageUrl: 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const FoodCard({super.key, required this.title, required this.imageUrl});

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
          title,
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
